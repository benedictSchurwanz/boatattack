require_relative 'cell'

class Board
	ROWS = (0..9).to_a
	COLUMNS = (0..9).to_a

	attr_reader :player

	def initialize(options = {})
		@hits = 0
		@misses = 0
		@board = blank_board
		@player = options[:player]
	end

	def cell_at(row, col)
		@board[row][col]
	end

	def random_cell
		@board[random_row][random_column]
	end

	def random_open_cell # not yet fired upon
		begin
			cell = random_cell
		end while cell.open?

		cell
	end

	def random_empty_cell
		begin
			cell = random_cell
		end while cell.boat != :empty

		cell
	end

	def random_occupied_cell
		begin
			cell = random_cell
		end while cell.boat == :empty

		cell
	end

	def hits
		how_many_hits = 0

		ROWS.each do |row|
			COLUMNS.each do |col|
				if cell_at(row, col).hit_status == :hit
					how_many_hits += 1
				end
			end
		end

		how_many_hits
	end

	def misses
		how_many_misses = 0

		ROWS.each do |row|
			COLUMNS.each do |col|
				if cell_at(row, col).hit_status == :miss
					how_many_misses += 1
				end
			end
		end

		how_many_misses
	end

	private

	def blank_board
		board = {}

		ROWS.each do |row|
			board[row] = {}

			COLUMNS.each do |col|
				board[row][col] = new_cell(row, col)
			end
		end

		board
	end

	def new_cell(x, y)
		Cell.new(x, y)
	end

	def random_row
		ROWS.sample
	end

	def random_column
		COLUMNS.sample
	end
end
