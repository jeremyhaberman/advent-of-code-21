# frozen_string_literal: true

class Dive

  # @param instructions List of instructions. Example:
  #   ["forward 2", "down 3", "up 1", "forward 4", "down 2"]
  def self.get_product(instructions)
    position = self.get_position(instructions)
    return position[:horizontal] * position[:depth]
  end

  def self.get_position(instructions)
    position = instructions.reduce({horizontal: 0, depth: 0}) do |position, instruction|
      motion, units = instruction.split
      units = units.to_i
      
      case motion
      when "forward"
        position[:horizontal] += units
      when "down"
        position[:depth] += units
      when "up"
        if position[:depth] < units
          raise StandardError
        end
        position[:depth] -= units
      end

      position
    end
  end
end
