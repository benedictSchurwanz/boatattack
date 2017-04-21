require_relative 'cell'

class Board
	ROWS = (1..10).to_a
	COLUMNS = [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]

	def initialize
		@board = blank_board
	end

	def random_cell
		@board[random_row][random_column]
	end

	private

	def blank_board
		board = {}

		ROWS.each do |row|
			board[row] = {}

			COLUMNS.each do |col|
				board[row][col] = Cell.new
			end
		end

		board
	end

	def random_row
		ROWS.sample
	end

	def random_column
		COLUMNS.sample
	end
end
