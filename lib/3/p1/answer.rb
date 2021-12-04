# frozen_string_literal: true
require_relative './binary_diagnostic'

report = File.readlines('lib/3/input.txt')
power_consumption = BinaryDiagnostic.power_consumption(report)
puts power_consumption