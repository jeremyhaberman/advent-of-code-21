# frozen_string_literal: true

class Dive

  STARTING_POSITION = { horizontal: 0, depth: 0, aim: 0 }

  # @param instructions List of instructions. Example:
  #   ["forward 2", "down 3", "up 1", "forward 4", "down 2"]
  def self.get_product(instructions)
    position = self.get_position(instructions)
    return position[:horizontal] * position[:depth]
  end

  def self.get_position(instructions)
    instructions.reduce(STARTING_POSITION) do |position, instruction|
      motion, units = instruction.split
      units = units.to_i
      
      case motion
      when "forward"
        position[:horizontal] += units
        position[:depth] += position[:aim] * units
      when "down"
        position[:aim] += units
      when "up"
        position[:aim] -= units
      end

      position
    end
  end
end
