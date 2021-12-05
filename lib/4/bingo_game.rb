# frozen_string_literal: true

# Day 4
class BingoGame
  attr_reader :number_order

  def initialize(game_input)
    @game = game_input
    @number_order = parse_number_order(game_input)
    @number_iterator = @number_order.each
  end

  def next_number
    @number_iterator.next
  end

  private

  def parse_number_order(game_input)
    game_input.first.split(',').map(&:to_i)
  end
end