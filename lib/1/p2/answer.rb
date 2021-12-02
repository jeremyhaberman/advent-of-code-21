# frozen_string_literal: true
require_relative './sonar_sweep'

measurements = File.readlines('lib/1/input.txt').map(&:to_i)
increases = SonarSweep.count_increases(measurements)
puts increases