# frozen_string_literal: true

require 'pry'
require 'minitest/autorun'
require_relative '../../../lib/2/p2/dive'

class DiveTest < Minitest::Test

  def test_part_2_step_1
    instructions = ["forward 5"]
    position = Dive.get_position(instructions)
    assert_equal 5, position[:horizontal]
    assert_equal 0, position[:depth]
    assert_equal 0, position[:aim]
  end

  def test_part_2_step_2
    instructions = ["forward 5", "down 5"]
    position = Dive.get_position(instructions)
    assert_equal 5, position[:horizontal]
    assert_equal 0, position[:depth]
    assert_equal 5, position[:aim]
  end

  def test_part_2_step_3
    instructions = ["forward 5", "down 5", "forward 8"]
    position = Dive.get_position(instructions)
    assert_equal 13, position[:horizontal]
    assert_equal 40, position[:depth]
    assert_equal 5, position[:aim]
  end

  def test_part_2_step_4
    instructions = ["forward 5", "down 5", "forward 8", "up 3"]
    position = Dive.get_position(instructions)
    assert_equal 13, position[:horizontal]
    assert_equal 40, position[:depth]
    assert_equal 2, position[:aim]
  end

  def test_part_2_step_5
    instructions = ["forward 5", "down 5", "forward 8", "up 3", "down 8"]
    position = Dive.get_position(instructions)
    assert_equal 13, position[:horizontal]
    assert_equal 40, position[:depth]
    assert_equal 10, position[:aim]
  end

  def test_part_2_step_6
    instructions = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    position = Dive.get_position(instructions)
    assert_equal 15, position[:horizontal]
    assert_equal 60, position[:depth]
    assert_equal 10, position[:aim]
  end
end

