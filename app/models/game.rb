require_relative 'player'
require_relative 'boat'
require_relative 'cell'
require_relative '../helpers/rand_helpers'
require_relative '../helpers/boat_helpers'

class Game
	attr_reader :players

	def initialize(options = {})
		lengths = bednar_fleet_lengths

		@players = {one: Player.new(name: "One", type: :human, lengths: lengths), two: Player.new(name: "Two", type: :computer, lengths: lengths)}
	end

	private

	def boat_will_fit?(starting_cell, boat_length, orientation)
		x = starting_cell.x
		y = starting_cell.y

		if orientation == :horizontal
			if (y + boat_length) < 10
				return true
			else
				return false
			end
		elsif orientation == :vertical
			if (x + boat_length) < 10
				return true
			else
				return false
			end
		end
	end

	def collect_cells(starting_cell, boat_length, orientation, player)
		cells = []
		row = starting_cell.x
		col = starting_cell.y

		if orientation == :horizontal
			boat_length.times do
				cells << player.board.cell_at(row, col)

				col += 1
			end
		else
			boat_length.times do
				cells << player.board.cell_at(row, col)

				row += 1
			end
		end

		cells
	end
end
