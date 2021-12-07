# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/4/bingo_game'

class BingoGameTest < Minitest::Test
  describe 'BingoGame' do
    before do
      game_input = File.readlines('test/4/test_input.txt')
      @game = BingoGame.new(game_input)
    end

    describe 'parse_input' do
      it 'should parse number drawing order' do
        expected_order = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10,
                          16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]
        assert_equal expected_order, @game.number_order
      end

      it 'should parse three cards' do
        assert_equal 3, @game.cards.length
      end

      it 'should parse card type' do
        assert @game.cards.first.is_a?(Card)
      end
    end

    describe '#draw_number' do
      it 'should draw all the numbers and raise StopIteration at the end' do
        game = BingoGame.new(['1, 2, 3'])
        assert_equal 1, game.draw_number
        assert_equal 2, game.draw_number
        assert_equal 3, game.draw_number
        assert_raises(StopIteration) do
          game.draw_number
        end
      end

      it 'should mark number on cards' do
        @game.draw_number
        assert_equal [[2,4]], @game.cards.first.marked_positions
        assert_equal [[2,2]], @game.cards[1].marked_positions
        assert_equal [[4,4]], @game.cards[2].marked_positions
      end
    end

    describe '#winners' do
      it 'should return the winner' do
        11.times { @game.draw_number }
        third_board = @game.cards[2]
        refute third_board.winner?

        @game.draw_number
        assert third_board.winner?
      end

      it 'should return the score of the winning card' do
        12.times { @game.draw_number }
        assert_equal 4512, @game.score(@game.cards[2])
      end

      it 'should identify the winner' do
        winners = @game.play_to_win
        assert_equal [@game.cards[2]], winners
      end
    end

    describe '#last_card_to_win' do
      it 'should return the last card to win' do
        card = @game.last_card_to_win
        assert @game.cards[1], card
      end
    end
  end
end
