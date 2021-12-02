# frozen_string_literal: true

class SonarSweep

  def self.measurement_window_sums(measurements)
    windows = self.measurement_windows(measurements)
    windows.map(&:sum)
  end

  def self.measurement_windows(measurements)
    measurements.each_index.reduce([]) do |result, index|
      [] if index < 2
      result << [measurements[index-2], measurements[index-1], measurements[index]]
    end
  end

  def self.count_increases(measurements)
    measurements = self.measurement_window_sums(measurements)

    count = 0
    measurements.each_with_index do |measurement, index|
      next if index.zero?
      if measurement > measurements[index-1]
        count += 1
      end
    end
    count
  end
end
