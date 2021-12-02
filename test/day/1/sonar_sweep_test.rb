# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/day/1/sonar_sweep'

class SonarSweepTest < Minitest::Test
  def test_count_depths
    measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    increases = SonarSweep.count_increases(measurements)
    assert_equal 7, increases
  end
end
