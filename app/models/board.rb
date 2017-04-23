require_relative 'cell'

class Board
	ROWS = (1..10).to_a
	COLUMNS = [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]
	DIRECTIONS = [:up, :right, :down, :left]

	def initialize
		@board = blank_board
	end

	def random_cell
		@board[random_row][random_column]
	end

	def random_empty_cell
		begin
			cell = random_cell
		end while cell.boat != :empty

		cell
	end

	private

	def blank_board
		board = {}

		ROWS.each do |row|
			board[row] = {}

			COLUMNS.each do |col|
				board[row][col] = Cell.new(row, col)
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
