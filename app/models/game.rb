require_relative 'player'
require_relative 'boat'
require_relative 'cell'
require_relative '../helpers/helpers'

class Game
	attr_reader :player

	def initialize(options = {})
		@player = {one: Player.new(type: :human), two: Player.new(type: :computer)}
	end
end
