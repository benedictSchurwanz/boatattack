require_relative 'boat'
require_relative 'cell'

class Player
	attr_accessor :board
	attr_reader :type

	def initialize(options = {})
		@board = blank_board
		@type = options[:type]
	end

	private

	def blank_board
		board = {}
		columns = [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]

		(1..10).each do |row|
			board[row] = {}

			columns.each do |col|
				board[row][col] = Cell.new
			end
		end

		board
	end

	def boat_setup
		{ carrier: Boat.new(length: 5),
			battleship: Boat.new(length: 4),
			cruiser: Boat.new(length: 3),
			destroyer1: Boat.new(length: 2),
			destroyer2: Boat.new(length: 2),
			submarine1: Boat.new(length: 1),
			submarine2: Boat.new(length: 1)
		}		
	end
end
