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

  def self.oxygen_generator_rating(report, important_bit: 0)
    mcb = self.most_common_bit_at_index(report, important_bit)
    if mcb.nil?
      mcb = 1
    end

    matching_numbers = report.filter { |number| number[important_bit] == mcb }
    
    if matching_numbers.length == 1
      matching_numbers[0].to_i(2)
    else
      self.oxygen_generator_rating(matching_numbers, important_bit: important_bit + 1)
    end
  end

  def self.co2_scrubber_rating(report, important_bit: 0)
    lcb = self.least_common_bit_at_index(report, important_bit)
    if lcb.nil?
      lcb = 0
    end

    matching_numbers = report.filter { |n| n[important_bit].to_i == lcb }
    
    if matching_numbers.length == 1
      matching_numbers[0].to_i(2)
    else
      self.co2_scrubber_rating(matching_numbers, important_bit: important_bit + 1)
    end
  end

  def self.life_support_rating(report)
    self.oxygen_generator_rating(report) * self.co2_scrubber_rating(report)
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

  def self.to_first_bits(report)
    report.map { |n| n[0] }
  end

  def self.most_common_bit_at_index(numbers, index)
    bits_at_index = numbers.map { |n| n[index] }
    self.most_common_bit(bits_at_index)
  end

  def self.least_common_bit_at_index(numbers, index)
    bits_at_index = numbers.map { |n| n[index].to_i }
    bit_counts = bits_at_index.each_with_object([0, 0]) do |b, obj|
      obj[b] += 1
    end

    return if bit_counts[0] < bit_counts[1]
      0
    elsif bit_counts[0] > bit_counts[1]
      1
    end
  end

  def self.most_common_first_bit(bits)
    self.most_common_bit(bits.map { |b| b[0] })
  end

  # Determines the most common bit in an array of bits
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
