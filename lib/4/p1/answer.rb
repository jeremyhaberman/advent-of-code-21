# frozen_string_literal: true
require_relative './bingo_game'

report = File.readlines('lib/4/input.txt')
game = BingoGame.new(report)
winning_cards = game.play_to_win
score = game.score(winning_cards[0])
puts score