# frozen_string_literal: true

class BinaryDiagnostic

  def self.most_common_bit(bits)
    counts = bits.reduce({ zeros: 0, ones: 0 }) do |counts, bit|
      if bit == "0"
        counts[:zeros] += 1
      else
        counts[:ones] += 1
      end
      counts
    end

    counts[:zeros] > counts[:ones] ? "0" : "1"
  end

  def self.most_common_bits(numbers)
    


    
    numbers.each.reduce([]) do |memo, number|
      number.split('')

      end
    end
    p numbers
  end
end
