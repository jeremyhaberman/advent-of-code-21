# frozen_string_literal: true

class BinaryDiagnostic

  # @param report [Array] of strings representing binary numbers
  #   e.g. ["00100", "11110"]
  def self.gamma_rate(report)
  end

  private

  # Determines the most common bit in an arra of bits
  # @param bits [Array] of strings, each representing one bit
  def self.most_common_bit(bits)
    num_zeros = bits.filter { |b| b == "0" }.length
    num_zeros > bits.length / 2.0 ? "0" : "1"
  end
end
