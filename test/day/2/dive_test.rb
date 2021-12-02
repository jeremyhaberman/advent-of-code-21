# frozen_string_literal: true

require 'pry'
require 'minitest/autorun'
require_relative '../../../lib/day/2/dive'

class DiveTest < Minitest::Test

  def test_no_horizontal_movement
    instructions = []
    result = Dive.get_position(instructions)
    assert_equal 0, result[:horizontal]
  end

  def test_forward_1_returns_1_for_horizontal_position
    instructions = ["forward 1"]
    result = Dive.get_position(instructions)
    assert_equal 1, result[:horizontal]
  end

  def test_forward_2_returns_2_for_horizontal_position
    instructions = ["forward 2"]
    result = Dive.get_position(instructions)
    assert_equal 2, result[:horizontal]
  end

  def test_forward_twice_returns_sum
    result = Dive.get_position(["forward 1", "forward 2"])
    assert_equal 3, result[:horizontal]
  end

  def test_down_1_returns_depth_of_1
    result = Dive.get_position(["down 1"])
    assert_equal 1, result[:depth]
  end

  def test_down_twice_returns_sum
    result = Dive.get_position(["down 1", "down 2"])
    assert_equal 3, result[:depth]
  end

  def test_forward_1_down_1_returns_1_for_each
    result = Dive.get_position(["forward 1", "down 1"])
    assert_equal 1, result[:horizontal]
    assert_equal 1, result[:depth]
  end

  def test_up_when_at_surface
    assert_raises do
      result = Dive.get_position(["up 1"])
    end
  end

  def test_up_1_when_depth_2
    result = Dive.get_position(["down 2", "up 1"])
    assert_equal 1, result[:depth]
  end

  def test_up_2_when_down_1
    assert_raises do
      result = Dive.get_position(["down 1", "up 2"])
    end
  end

  def test_example
    instructions = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    result = Dive.get_position(instructions)
    assert_equal 15, result[:horizontal]
    assert_equal 10, result[:depth]
  end

  def test_product_with_zero_for_both
    assert_equal 0, Dive.get_product([])
  end

  def test_product_with_only_horizontal
    assert_equal 0, Dive.get_product(["forward 2"])
  end

  def test_product_with_only_down
    assert_equal 0, Dive.get_product(["down 2"])
  end

  def test_product_with_example
    instructions = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    result = Dive.get_product(instructions)
    assert_equal 150, result
  end

  def test_from_input
    instructions = File.readlines('test/day/2/input.txt')
    result = Dive.get_product(instructions)
    assert_equal 150, result
  end
end

