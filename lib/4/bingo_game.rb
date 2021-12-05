# frozen_string_literal: true

# Day 4
class BingoGame
  attr_reader :number_order, :cards

  def initialize(game_input)
    @game = game_input
    @number_order = parse_number_order(game_input)
    @number_iterator = @number_order.each
    @cards = parse_cards(game_input)
  end

  def next_number
    @number_iterator.next
  end

  private

  def parse_number_order(game_input)
    game_input.first.split(',').map(&:to_i)
  end

  def parse_cards(game_input)
    game_input[1..]
      .each_slice(6)
      .map { |slice| slice[1..].map(&:strip) }
      .map { |card| card.map { |row| row.split.map(&:to_i) } }
  end
end
