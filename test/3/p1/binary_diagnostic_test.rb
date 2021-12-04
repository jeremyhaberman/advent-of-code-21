# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/3/p1/binary_diagnostic'

class BinaryDiagnosticTest < Minitest::Test

  def test_power_consumption
    test_input = File.readlines('test/3/test_input.txt')
    power_consumption = BinaryDiagnostic.power_consumption(test_input)
    assert_equal 198, power_consumption
  end

  def test_gamma_rate
    test_input = File.readlines('test/3/test_input.txt')
    gamma_rate = BinaryDiagnostic.gamma_rate(test_input)
    assert_equal 22, gamma_rate
  end

  def test_epsilon_rate
    test_input = File.readlines('test/3/test_input.txt')
    gamma_rate = BinaryDiagnostic.epsilon_rate(test_input)
    assert_equal 9, gamma_rate
  end

  def test_most_common_bit_zero
    bits = ["0", "1", "0"]
    mcb = BinaryDiagnostic.send(:most_common_bit, bits)
    assert_equal "0", mcb
  end

  def test_most_common_bit_one
    bits = ["0", "1", "0", "1", "1"]
    mcb = BinaryDiagnostic.send(:most_common_bit, bits)
    assert_equal "1", mcb
  end

  def test_least_common_bit_zero
    bits = ["0", "1", "0"]
    mcb = BinaryDiagnostic.send(:least_common_bit, bits)
    assert_equal "1", mcb
  end

  def test_least_common_bit_one
    bits = ["0", "1", "0", "1", "1"]
    mcb = BinaryDiagnostic.send(:least_common_bit, bits)
    assert_equal "0", mcb
  end

  def test_to_bits
    report = ["010", "101", "000", "111"]
    bits = BinaryDiagnostic.send(:to_bits, report)
    expected = [
      ["0", "1", "0", "1"],
      ["1", "0", "0", "1"],
      ["0", "1", "0", "1"]
    ]
    assert_equal expected, bits
  end

  def test_to_bits_should_trim_whitespace
    report = ["01\n", "10\n"]
    bits = BinaryDiagnostic.send(:to_bits, report)
    expected = [
      ["0", "1"],
      ["1", "0"]
    ]
    assert_equal expected, bits
  end

  ### PART 2 ###

  describe "Part 2" do
    before do
      @test_input = File.readlines('test/3/test_input.txt', chomp: true)
    end

    it "should return life support rating" do
      life_support_rating = BinaryDiagnostic.life_support_rating(@test_input)
      assert_equal 230, life_support_rating
    end

    it "should return the oxygen generator rating" do
      oxygen_generator_rating = BinaryDiagnostic.oxygen_generator_rating(@test_input)
      assert_equal 23, oxygen_generator_rating
    end

    it "should return the CO2 scrubber rating" do
      oxygen_generator_rating = BinaryDiagnostic.co2_scrubber_rating(@test_input)
      assert_equal 10, oxygen_generator_rating
    end

    it "should return first bits" do
      report = ["010", "101", "000", "111"]
      first_bits = BinaryDiagnostic.send(:to_first_bits, report)
      assert_equal ["0", "1", "0", "1"], first_bits
    end

    it "should return most common bit" do
      report = ["010", "101", "000", "111"]
      mcb = BinaryDiagnostic.send(:most_common_bit_at_index, report, 0)
      assert_equal "1", mcb
    end

    it "should return most common bit at index 1" do
      report = ["010", "111", "000", "111"]
      mcb = BinaryDiagnostic.send(:most_common_bit_at_index, report, 1)
      assert_equal "1", mcb
    end

    it "should return most common bit at index 2" do
      report = ["010", "111", "000", "110"]
      mcb = BinaryDiagnostic.send(:most_common_bit_at_index, report, 2)
      assert_equal "0", mcb
    end
  end

  describe "final" do
    it "should return 4160394 for part 1" do
      input = File.readlines("lib/3/input.txt", chomp: true)
      answer = BinaryDiagnostic.power_consumption(input)
      assert_equal 4160394, answer
    end
    
    it "should return 4125600 for part 2" do
      input = File.readlines("lib/3/input.txt", chomp: true)
      answer = BinaryDiagnostic.life_support_rating(input)
      assert_equal 4125600, answer
    end
  end

end