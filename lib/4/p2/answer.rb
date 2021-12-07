# frozen_string_literal: true
require_relative '../bingo_game'

report = File.readlines('lib/4/input.txt')
game = BingoGame.new(report)
card = game.last_card_to_win
score = game.score(card)
puts score