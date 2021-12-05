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
      assert_equal @numbers, @card.numbers
    end

    it 'return true if the card has the number' do
      assert_equal true, @card.mark(3)
    end

    it 'return false if the card does not have the number' do
      assert_equal false, @card.mark(1)
    end

    it 'return marked number position' do
      @card.mark(3)
      assert_equal [[0, 0]], @card.markers
    end

    it 'return marked number positions' do
      @card.mark(3)
      @card.mark(2)
      @card.mark(24)
      @card.mark(1)
      assert_equal [[0, 0], [0, 3], [3, 3]], @card.markers
    end
  end
end
