# frozen_string_literal: true
require_relative './sonar_sweep_v2'

measurements = File.readlines('lib/day/1/input.txt').map(&:to_i)
increases = SonarSweepV2.count_increases(measurements)
puts increases