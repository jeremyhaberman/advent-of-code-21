# frozen_string_literal: true

class BinaryDiagnostic

  # @param report [Array] of strings representing binary numbers
  #   e.g. ["00100", "11110"]
  def self.gamma_rate(report)
    self.to_bits(report).
      map { |num_as_bits| self.most_common_bit(num_as_bits) }.
      reduce("") { |memo, bit| memo << bit }
  end

  private

  def self.to_bits(report)
    bits = report.each_with_object([]) do |number, array|
      number.split('').each_with_index do |n, i|
        if array.at(i).nil?
          array[i] = []
        end
        array[i] << n
      end
    end
  end

  # Determines the most common bit in an arra of bits
  # @param bits [Array] of strings, each representing one bit
  def self.most_common_bit(bits)
    num_zeros = bits.filter { |b| b == "0" }.length
    num_zeros > bits.length / 2.0 ? "0" : "1"
  end
end
