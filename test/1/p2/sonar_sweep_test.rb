# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/1/p2/sonar_sweep'

MEASUREMENTS = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

class SonarSweepTest < Minitest::Test

  def test_measurement_windows_with_one_element
    measurements = MEASUREMENTS[..0]
    windows = SonarSweep.measurement_windows(measurements)
    assert_equal [], windows
  end

  def test_measurement_windows_with_two_element
    measurements = MEASUREMENTS[..1]
    windows = SonarSweep.measurement_windows(measurements)
    assert_equal [], windows
  end

  def test_measurement_windows_with_three_element
    measurements = MEASUREMENTS[..2]
    windows = SonarSweep.measurement_windows(measurements)
    assert_equal [[199, 200, 208]], windows
  end

  def test_measurement_windows_with_four_elements
    measurements = MEASUREMENTS[..3]
    windows = SonarSweep.measurement_windows(measurements)
    assert_equal [[199, 200, 208], [200, 208, 210]], windows
  end

  def test_measurement_window_sum_with_three
    measurements = MEASUREMENTS[..2]
    window_sums = SonarSweep.measurement_window_sums(measurements)
    assert_equal [607], window_sums
  end

  def test_measurement_window_sum_with_four
    measurements = MEASUREMENTS[..3]
    window_sums = SonarSweep.measurement_window_sums(measurements)
    assert_equal [607, 618], window_sums
  end

  def test_measurement_window_sum_with_all
    window_sums = SonarSweep.measurement_window_sums(MEASUREMENTS)
    assert_equal [607, 618, 618, 617, 647, 716, 769, 792], window_sums
  end

  def test_count_increases
    increases = SonarSweep.count_increases(MEASUREMENTS)
    assert_equal 5, increases
  end
end
