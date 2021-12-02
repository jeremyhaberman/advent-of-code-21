# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/day/1/sonar_sweep'

class SonarSweepTest < Minitest::Test
  def test_count_depths
    measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    increases = SonarSweep.count_increases(measurements)
    assert_equal 7, increases
  end

  def test_parse_measurements
    file = File.open("test/day/1/input.txt")
    measurements = SonarSweep.parse_measurements(file)
    assert_equal [199, 200, 208, 210, 200, 207, 240, 269, 260, 263], measurements
  end
end
