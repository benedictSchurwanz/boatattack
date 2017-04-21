require_relative 'boat'
require_relative 'cell'

class Player
	# attr_accessor :board
	attr_reader :type, :boats

	def initialize(options = {})
		@board = Board.new
		@type = options[:type]
	end

	private
	
end
