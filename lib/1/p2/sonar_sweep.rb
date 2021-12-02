# frozen_string_literal: true

class SonarSweep

  def self.measurement_window_sums(measurements)
    windows = self.measurement_windows(measurements)
    windows.map { |w| w.sum  }
  end

  def self.measurement_windows(measurements)
    return [] if measurements.length < 3

    first = 0
    windows = []

    while first + 2 < measurements.length
      windows << [measurements[first], measurements[first+1], measurements[first+2]]
      first += 1
    end
    
    windows
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
