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

    it 'should parse three cards' do
      assert_equal 3, @game.cards.length
    end

    it 'should parse cards' do
      first = [
        [22, 13, 17, 11, 0],
        [8, 2, 23, 4, 24],
        [21, 9, 14, 16, 7],
        [6, 10, 3, 18, 5],
        [1, 12, 20, 15, 19]
      ]
      assert_equal first, @game.cards.first

      second = [
        [3, 15, 0, 2, 22],
        [9, 18, 13, 17, 5],
        [19, 8, 7, 25, 23],
        [20, 11, 10, 24, 4],
        [14, 21, 16, 12, 6]]
      assert_equal second, @game.cards[1]

      third = [
        [14, 21, 17, 24, 4],
        [10, 16, 15, 9, 19],
        [18, 8, 23, 26, 20],
        [22, 11, 13, 6, 5],
        [2, 0, 12, 3, 7]]
      assert_equal third, @game.cards[2]
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
