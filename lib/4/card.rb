# frozen_string_literal: true

class Card
  attr_reader :numbers, :markers

  def initialize(numbers)
    @numbers = numbers
    @markers = []
  end

  def mark(number)
    @numbers.each_with_index do |row, row_index|
      row.each_with_index do |n, column_index|
        if n == number
          @markers << [row_index, column_index]
          return true
        end
      end
    end
    false
  end
end
