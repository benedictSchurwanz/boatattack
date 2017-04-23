require_relative 'board'
require_relative 'boat'
require_relative '../helpers/boat_helpers'

class Player
	attr_accessor :board, :volley
	attr_reader :type, :fleet, :name

	def initialize(options = {})
		lengths = options[:lengths]
		lengths ||= bednar_fleet_lengths

		@board = Board.new
		@name = options[:name]
		@type = options[:type] # human or computer
		@fleet = generate_fleet(lengths)
		@volley = options[:volley]
		@volley ||= @fleet.length
	end

	def boat_sunk
		@volley -= 1
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
