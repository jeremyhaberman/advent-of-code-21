# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/4/bingo_game'

class BingoGameTest < Minitest::Test
  describe 'parse_input' do
    before do
      game_input = File.readlines('test/4/test_input.txt')
      @game = BingoGame.new(game_input)
    end

    it 'should parse number drawing order' do
      expected_order = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10,
                        16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]
      assert_equal expected_order, @game.number_order
    end
  end

  describe '#next_number' do
    it 'should draw all the numbers and raise StopIteration at the end' do
      game = BingoGame.new(['1, 2, 3'])
      assert_equal 1, game.next_number
      assert_equal 2, game.next_number
      assert_equal 3, game.next_number
      assert_raises(StopIteration) do
        game.next_number
      end
    end
  end
end
