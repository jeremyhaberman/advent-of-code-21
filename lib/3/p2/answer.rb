# frozen_string_literal: true
require_relative '../p1/binary_diagnostic'

report = File.readlines('lib/3/input.txt', chomp: true)
life_support_rating = BinaryDiagnostic.life_support_rating(report)
puts life_support_rating