require_relative 'board'
require_relative 'boat'
require_relative '../helpers/boat_helpers'

class Player
	attr_accessor :board
	attr_reader :type, :fleet, :name, :volley_size

	def initialize(options = {})
		lengths = options[:lengths]
		lengths ||= bednar_fleet_lengths

		@board = Board.new
		@name = options[:name]
		@name ||= "Player"
		@type = options[:type] # :human or :computer
		@fleet = generate_fleet(lengths)
		@volley_size = options[:volley_size]
		@volley_size ||= @fleet.length

		if @type == :computer
			@name = "Computer"
		end
	end

	def boats_remaining
		boats = @fleet.find_all { |boat| boat.afloat? }

		boats.length
	end

	def boat_sunk
		@volley_size -= 1
	end

	def defeated?
		boats_remaining <= 0
	end

	private

	def generate_fleet(lengths)
		fleet = []

		lengths.each do |boat_length|
			fleet << Boat.new(length: boat_length, player: self)
		end

		fleet
	end
end
