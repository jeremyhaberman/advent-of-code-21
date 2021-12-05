# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/4/bingo_game'

class BingoGameTest < Minitest::Test
  describe 'parse_input' do
    it 'should parse number drawing order' do
      game_input = File.readlines('test/4/test_input.txt')
      game = BingoGame.new(game_input)
      expected_order = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10,
                        16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]
      assert_equal expected_order, game.number_order
    end
  end
end
