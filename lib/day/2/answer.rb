# frozen_string_literal: true

require_relative './dive'

puts Dive.get_product(File.readlines('lib/day/2/input.txt'))