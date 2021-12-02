# frozen_string_literal: true

require_relative './dive'

puts Dive.get_product(File.readlines('lib/2/input.txt'))