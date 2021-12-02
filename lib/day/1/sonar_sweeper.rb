# frozen_string_literal: true
require_relative './sonar_sweep'

file = File.open('lib/day/1/input.txt')
measurements = SonarSweep.parse_measurements(file)
increases = SonarSweep.count_increases(measurements)
puts increases