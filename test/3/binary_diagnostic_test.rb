# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/3/binary_diagnostic'

class BinaryDiagnosticTest < Minitest::Test

  def test_gamma_rate
    test_input = File.readlines('test/3/test_input.txt')
    gamma_rate = BinaryDiagnostic.gamma_rate(test_input)
    assert_equal 22, gamma_rate
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

end