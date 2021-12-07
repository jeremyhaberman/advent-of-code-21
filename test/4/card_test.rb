# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/4/card'

class CardTest < Minitest::Test
  describe 'Card' do
    before do
      @numbers = [
        [3, 15, 0, 2, 22],
        [9, 18, 13, 17, 5],
        [19, 8, 7, 25, 23],
        [20, 11, 10, 24, 4],
        [14, 21, 16, 12, 6]
      ]

      @card = Card.new(@numbers)
    end
    it 'should initialize numbers' do
      expected = { [0, 0] => [3, false],  [0, 1] => [15, false], [0, 2] => [0, false],  [0, 3] => [2, false],  [0, 4] => [22, false],
                   [1, 0] => [9, false],  [1, 1] => [18, false], [1, 2] => [13, false], [1, 3] => [17, false], [1, 4] => [5, false],
                   [2, 0] => [19, false], [2, 1] => [8, false],  [2, 2] => [7, false],  [2, 3] => [25, false], [2, 4] => [23, false],
                   [3, 0] => [20, false], [3, 1] => [11, false], [3, 2] => [10, false], [3, 3] => [24, false], [3, 4] => [4, false],
                   [4, 0] => [14, false], [4, 1] => [21, false], [4, 2] => [16, false], [4, 3] => [12, false], [4, 4] => [6, false] }

      assert_equal expected, @card.numbers
    end

    it 'return true if the card has the number' do
      assert_equal true, @card.mark(3)
    end

    it 'return false if the card does not have the number' do
      assert_equal false, @card.mark(1)
    end

    it 'return marked number position' do
      @card.mark(3)
      expected = [
        [
          [0, 0], [3, true]
        ]
      ]
      assert_equal expected, @card.markers
    end

    it 'return marked number positions' do
      @card.mark(3)
      @card.mark(2)
      @card.mark(24)
      @card.mark(1)  # not actually on the card
      assert_equal [[0, 0], [0, 3], [3, 3]], @card.marked_positions
      assert_equal [3, 2, 24], @card.marked_numbers
    end
  end
end
