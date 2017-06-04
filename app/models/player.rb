require_relative 'board'
require_relative 'boat'
require_relative '../helpers/boat_helpers'

class Player
	attr_accessor :shots_fired, :won, :boats_sunk
	attr_reader :board
	attr_reader :type, :fleet, :name

	def initialize(options = {})
		lengths = options[:lengths]
		lengths ||= bednar_fleet_lengths

		@board = new_board

		@type = options[:type] # :human or :computer

		@name = options[:name]
		@name = "Computer" if @type == :computer
		@name ||= "Player"
		
		@fleet = generate_fleet(lengths)
		
		# this not used at this time, volley size will be calculated from boats_remaining
		# but it will need to be refactored into an instance variable if there are options for different volley sizes
		# @volley_size = options[:volley_size] 
		# @volley_size ||= @fleet.length

		@shots_fired = 0
		@boats_sunk = 0

		@won = false

		# TBI: retrieve from db: how many games won, how many lost
	end

	def new_board
		Board.new(player: self)
	end

	def boats_remaining
		boats = @fleet.find_all { |boat| boat.afloat? }

		boats
	end

	def volley_size
		boats_remaining.length
	end

	def defeated?
		boats_remaining.length <= 0
	end

	private

	def generate_fleet(lengths)
		fleet = []

		lengths.each do |boat_length|
			fleet << new_boat(boat_length)
		end

		fleet
	end

	def new_boat(length)
		Boat.new(length: length, player: self)
	end
end
