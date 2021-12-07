# frozen_string_literal: true

class Card
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers.each_with_object({}).with_index do |(row, obj), row_index|
      row.each_with_index do |n, column_index|
        obj[[row_index, column_index]] = [n, false]
      end
    end
  end

  def mark(number)
    @numbers.each_value do |num|
      if num[0] == number
        num[1] = true
        return true
      end
    end

    false
  end

  def markers
    @numbers.each_with_object([]) do |(k, v), array|
      array << [k, v] if v[1]
    end
  end

  def marked_positions
    @numbers.each_with_object([]) do |(k, v), marked|
      marked << k if v[1]
    end
  end

  def marked_numbers
    @numbers.each_with_object([]) do |(_k, v), marked|
      marked << v[0] if v[1]
    end
  end

  def winner?
    # check rows
    (0..4).each do |row_index|
      hits = @numbers
             .select { |k, _v| k[0] == row_index }
             .values
             .filter { |v| v[1] == true }

      return true if hits.length == 5
    end

    # check columns
    (0..4).each do |column_index|
      hits = @numbers
               .select { |k, _v| k[1] == column_index }
               .values
               .filter { |v| v[1] == true }

      return true if hits.length == 5
    end

    false
  end

  def view
    view_str = +''
    @numbers.each do |k, v|
      view_str += if v[1]
                    format('[%2s]  ', v[0])
                  else
                    format(' %2s   ', v[0])
                  end
      view_str += "\n" if k[1] == 4
    end
    view_str
  end
end
