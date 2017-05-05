module View
	# print "\e[x;yH" - moves cursor to line x column y
	
	################## report methods #################

	def report_shot(cell)
		if cell.hit_status == :hit 
			report_hit
		elsif cell.hit_status == :miss
			report_miss
		end
	end

	def report_hit
		print "\nYou scored a hit! KABLOOIE!"
	end

	def report_miss
		print "\nYou missed. SPLASH!"
	end

	def report_sunk(boat)
		print "\nYou sunk my #{boat.name}!"
	end

	def game_won_by(player)
		print "#{player.name} wins!"
	end

	################# print methods ###################

	def clear_screen
		print "\e[2J"
	end

	def cursor_to_home
		print "\e[H"
	end

	def reset_screen
		clear_screen
		cursor_to_home
	end

	def print_empty_board
		print <<~EOS
			\n     A   B   C   D   E   F   G   H   I   J
			   +---------------------------------------+
			 1 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 2 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 3 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 4 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 5 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 6 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 7 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 8 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			 9 |   |   |   |   |   |   |   |   |   |   |
			   |---|---|---|---|---|---|---|---|---|---|
			10 |   |   |   |   |   |   |   |   |   |   |
			   +---------------------------------------+\n
   		EOS
	end

	def reset_board
		reset_screen
		print_empty_board
	end

	def print_current_board(board, player)
		reset_board

		print_player(player)

		cursor_to_start

		10.times do |row|
			print_row(board, row)

			advance_down
		end

		cursor_to_end
	end

	def print_player(player)
		print "\e[1;15H"
		print "#{player.name}'s Turn"
	end

	def cursor_to_start
		print "\e[4;6H"
	end

	def print_row(board, row)
		10.times do |col|
			print_status(board.cell_at(row, col).hit_status)

			advance_right
		end
	end

	def advance_right
		print "\e[3C"		# move cursor right one cell
	end

	def advance_down
		print "\e[2B"		# move cursor down one row
		print "\e[40D"	# move cursor left to start of row
	end

	def print_status(status)
		if status == :hit
			print "X"
		elsif status == :miss
			print "/"
		elsif status == :open
			print " "
		end
	end

	def cursor_to_end
		print "\e[25;1H"
	end

	def end_of_turn
		print "\nPress enter to continue. "
		gets.chomp
	end

	def print_score
		
	end

	#################### Input ################

	def user_select_target(opponent)
		board = opponent.board

		begin
			print "Please enter coordinates (a letter and a number; e.g. 'a,1')  "
			input = gets.chomp

			valid = validate(input)

		end while !valid

		indices = convert_coordinates(input)

		row = indices[0]
		col = indices[1]

		board.cell_at(row, col)
	end

	def validate(input)
		if input.match(/[a-zA-Z],\s*\d{1,2}/)

			return true
		else
			puts "Please enter coordinates in the correct format (\"a, 1\") "

			return false
		end
	end

	def convert_coordinates(input)
		number = get_number(input)
		row = convert_number_to_index(number)

		letter = get_letter(input)
		column = convert_letter_to_index(letter)

		coordinates = [row, column]
	end

	def get_letter(coords)
		coords.match(/\A[a-zA-Z]/)
	end

	def get_number(coords)
		coords.match(/(\d+)\s*\z/)
	end

	def convert_letter_to_index(letter)
		columns = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

		columns.index(letter.downcase)
	end

	def convert_number_to_index(number)
		number.to_i - 1
	end

	# methods for testing

	def hit(x,y)
		row = 2 + (x * 4)
		col = 1 + (y * 6)

		reset_board

		print "\e[#{row};#{col}H"
		print "X"
		print "\e[45;18H"
	end

	def miss(x,y)
		row = 2 + (x * 4)
		col = 1 + (y * 6)

		reset_board

		print "\e[#{row};#{col}H"
		print "/"
		print "\e[45;1H"
	end
end
