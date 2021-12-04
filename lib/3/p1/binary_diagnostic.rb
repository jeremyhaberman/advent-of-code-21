# frozen_string_literal: true

require 'pry'

class BinaryDiagnostic

  # @param report [Array] of strings representing binary numbers
  #   e.g. ["00100", "11110"]
  def self.gamma_rate(report)
    self.to_bits(report).
      map { |num_as_bits| self.most_common_bit(num_as_bits) }.
      reduce("") { |binary_number, bit| binary_number += bit }.
      to_i(2)
  end

  def self.epsilon_rate(report)
    self.to_bits(report).
      map { |num_as_bits| self.least_common_bit(num_as_bits) }.
      reduce("") { |binary_number, bit| binary_number += bit }.
      to_i(2)
  end

  def self.power_consumption(report)
    self.gamma_rate(report) * self.epsilon_rate(report)
  end

  private

  def self.to_bits(report)
    bits = report.each_with_object([]) do |number, array|
      number.strip.split('').each_with_index do |n, i|
        if array.at(i).nil?
          array[i] = []
        end
        array[i] << n
      end
    end
    bits
  end

  # Determines the most common bit in an arra of bits
  # @param bits [Array] of strings, each representing one bit
  def self.most_common_bit(bits)
    num_zeros = bits.filter { |b| b == "0" }.length
    num_zeros > bits.length / 2.0 ? "0" : "1"
  end

  def self.least_common_bit(bits)
    most_common_bit = self.most_common_bit(bits)
    most_common_bit == "0" ? "1" : "0"
  end
end
