require_relative 'player'
require_relative '../helpers/boat_helpers'
require_relative '../views/view'
# require 'pry'

class Game
	include View

	attr_reader :players, :won

	def initialize(options = {})
		@lengths = # options[:lengths] ||
							 bednar_fleet_lengths

		@players = Array.new
		players_setup

		@won = false
		@winner = nil

		get_score
	end

	def new_player(args = {})
		Player.new(name: args[:name], type: args[:type], lengths: args[:lengths])
	end

	def players_setup
		@players[0] = new_player(name: "Player One", type: :human, lengths: @lengths)
		@players[1] = new_player(type: :computer, lengths: @lengths)
	end

	def get_score
		@score = Hash.new

		@players.each do |player|
			stats = Hash.new

			opponent = get_opponent_of(player)

			stats[:shots_fired] = player.shots_fired
			stats[:boats_sunk] = player.boats_sunk
			stats[:hits] = opponent.board.hits
			stats[:misses] = opponent.board.misses

			@score[player] = stats
		end

		@score
	end

	def setup
		@players.each do |player|
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
				end
			end
		end
	end

	############################ turn ##########################

	def turn(player, opponent)
		volley_size = player.volley_size

		volley_size.times do |i|
			print_current_board(opponent.board, player)

			puts "Shots remaining: #{volley_size - i}" if volley_size > 1
			puts "Opponent boats afloat: #{opponent.boats_remaining.length}"

			target = select_target(player.type, opponent.board)
			# target will be the particular Cell object from the opponent's board

			if target == :debug_winner
				@won = true
				@winner = human_player
				return nil
			end

			result = fire_on(target)
			player.shots_fired += 1

			print_current_board(opponent.board, player)

			print_computers(target) if player.type == :computer

			report_shot(result, player.type)	# views

			if target.hit_status == :hit
				target.boat.hit

				if target.boat.sunk?
					report_sunk(target.boat) # Views method

					player.boats_sunk += 1

					if opponent.defeated?
						game_won_by(player)

						@won = true
						@winner = player

					 	break
					end
				end
			end

			continue
		end

		continue if @won
	end

	def select_target(type, opponent_board)
		if type == :human
			target = user_select_target(opponent_board)
		elsif type == :computer
			target = get_target_from(opponent_board)
		end
	end

	###################### Play #########################

	def play
		setup

		while !@won
			@players.each do |player|
				opponent = get_opponent_of(player)

				turn(player, opponent)

				break if @won
			end
		end

		get_score

		print_score(human_player, @score[human_player])
	end

	def human_player
		# @players.each do |player|
		# 	return player if player.type == :human
		# end

		@players[0]
	end

	# private #####################################################

	def get_opponent_of(player)
		opponent = nil

		@players.each do |p|
			if p != player
				opponent = p
			end
		end

		opponent
	end

	def fire_on(target)
		target.shoot_at

		target.hit_status
	end

	def get_target_from(board)
		board.random_open_cell
	end

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
