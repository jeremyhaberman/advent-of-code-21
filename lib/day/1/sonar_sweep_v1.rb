# frozen_string_literal: true

class SonarSweepV1
  def self.count_increases(measurements)
    count = 0
    measurements.each_with_index do |measurement, index|
      next if index.zero?
      if measurement > measurements[index-1]
        count += 1
      end
    end
    count
  end

  def self.parse_measurements(file)
    file.readlines.map(&:to_i)
  end
end
