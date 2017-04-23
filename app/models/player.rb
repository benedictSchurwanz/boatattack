require_relative 'board'
require_relative 'boat'
require_relative '../helpers/boat_helpers'

class Player
	attr_accessor :board
	attr_reader :type

	def initialize(options = {})
		@board = Board.new
		@type = options[:type] # human or computer
	end
end
