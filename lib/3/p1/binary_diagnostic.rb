# frozen_string_literal: true

require 'pry'

class BinaryDiagnostic

  def self.power_consumption(report)
    self.gamma_rate(report) * self.epsilon_rate(report)
  end

  def self.gamma_rate(report)
    report.first.length.times.
      each_with_object([]) { |bit_index, array|
        array[bit_index] = self.most_common_bit_at_index(report, bit_index)
      }.
      reduce("") { |binary_number, bit| binary_number += bit }.
      to_i(2)
  end

  def self.epsilon_rate(report)
    report.first.length.times.
      each_with_object([]) { |bit_index, array|
        array[bit_index] = self.least_common_bit_at_index(report, bit_index)
      }.
      reduce("") { |binary_number, bit| binary_number += bit }.
      to_i(2)
  end

  def self.life_support_rating(report)
    self.oxygen_generator_rating(report) * self.co2_scrubber_rating(report)
  end

  def self.oxygen_generator_rating(report, important_bit: 0)
    numbers = numbers_with_most_common_bit_at_index(report, important_bit)
    if numbers.length == 1
      numbers.first.to_i(2)
    else
      self.oxygen_generator_rating(numbers, important_bit: important_bit + 1)
    end
  end

  def self.co2_scrubber_rating(report, important_bit: 0)
    numbers = numbers_with_least_common_bit_at_index(report, important_bit)
    if numbers.length == 1
      numbers.first.to_i(2)
    else
      self.co2_scrubber_rating(numbers, important_bit: important_bit + 1)
    end
  end

  private

  def self.numbers_with_most_common_bit_at_index(report, index)
    report.filter do |number|
      number[index] == self.most_common_bit_at_index(report, index)
    end
  end

  def self.numbers_with_least_common_bit_at_index(report, index)
    report.filter do |number|
      number[index] == self.least_common_bit_at_index(report, index)
    end
  end

  def self.most_common_bit_at_index(numbers, index)
    bit_counts = self.bit_counts(numbers, index)
    bit_counts[1] >= bit_counts[0] ? "1" : "0"
  end

  def self.least_common_bit_at_index(numbers, index)
    bit_counts = self.bit_counts(numbers, index)
    bit_counts[0] <= bit_counts[1] ? "0" : "1"
  end

  def self.bit_counts(numbers, index)
    bits_at_index = numbers.map { |n| n[index].to_i }
    bit_counts = bits_at_index.each_with_object([0, 0]) do |bit, array|
      array[bit] += 1
    end
  end
end
