require_relative 'player'
require_relative '../helpers/boat_helpers'

class Game
	attr_reader :players

	def initialize(options = {})
		lengths = options[:lengths] 
		lengths ||= bednar_fleet_lengths

		@players = {one: Player.new(name: "One", type: :human, lengths: lengths), two: Player.new(name: "Two", type: :computer, lengths: lengths)}
	end

	def setup
		@players.each do |key, player|
			place_fleet(player)
		end
	end

	def place_fleet(player)
		player.fleet.each do |boat|
			length = boat.length

			loop do
				cell = player.board.random_empty_cell

				if boat_will_fit?(cell, length, :horizontal)
					cells = collect_cells(cell, length, :horizontal, player)
				elsif boat_will_fit?(cell, length, :vertical)
					cells = collect_cells(cell, length, :vertical, player)
				else
					next
				end

				if cells_are_empty?(cells)
					boat.occupy(cells)

					cells.each do |cell|
						cell.occupied_by(boat)
					end

					break
				else
					next
				end
			end 
		end
	end

	def turn(player, opponent)
		volley = player.volley

		volley.times do 
			target = opponent.choose_cell

			opponent.fired_upon(target)
			volley -= 1
			
			report_hit_status(target)
			
			if target.hit_status == :hit 
				if target.boat.sunk? 
					report_sunk(target.boat)
					
					opponent.boat_sunk
				end
			end
		end

		if opponent.defeated?
			game_won_by(player)
		end
	end

	private

	def boat_will_fit?(starting_cell, boat_length, orientation)
		row = starting_cell.row
		col = starting_cell.col

		if orientation == :horizontal
			if (col + boat_length) <= 10
				return true
			else
				return false
			end
		elsif orientation == :vertical
			if (row + boat_length) <= 10
				return true
			else
				return false
			end
		end
	end

	def cells_are_empty?(cells_array)
		cells_array.each do |cell|
			if cell.boat != :empty
				return false
			end
		end

		return true
	end

	def collect_cells(starting_cell, boat_length, orientation, player)
		cells = []
		row = starting_cell.row
		col = starting_cell.col

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
