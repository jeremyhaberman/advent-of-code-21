# frozen_string_literal: true
require_relative './sonar_sweep_v1'

file = File.open('lib/day/1/input.txt')
measurements = SonarSweepV1.parse_measurements(file)
increases = SonarSweepV1.count_increases(measurements)
puts increases