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
end
