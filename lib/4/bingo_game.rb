# frozen_string_literal: true

require_relative './card'

# Day 4
class BingoGame
  attr_reader :number_order, :cards

  def initialize(game_input)
    @game = game_input
    @number_order = parse_number_order(game_input)
    @number_iterator = @number_order.each
    @cards = parse_cards(game_input)
  end

  def draw_number
    number = @number_iterator.next
    @cards.each { |c| c.mark(number) }
    @last_number = number
    number
  end

  def score(card)
    card.unmarked_numbers.sum * @last_number
  end

  def play_to_win
    loop do
      draw_number
      break if winners.any?
    end
    winners
  end

  def winners
    @cards.filter { |c| c.winner? }
  end

  def last_card_to_win
    loop do
      draw_number
      break if winners.length == @cards.length - 1
    end

    last_card = @cards.filter { |c| !winners.include?(c) }.first

    loop do
      draw_number
      break if last_card.winner?
    end

    last_card
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
      .map { |card_data| Card.new(card_data) }
  end
end
