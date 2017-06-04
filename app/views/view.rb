module View
	# print "\e[x;yH" - moves cursor to line x column y
	
	################## report methods #################

	def report_shot(result, player_type)
		if result == :hit 
			report_hit(player_type)
		elsif result == :miss
			report_miss(player_type)
		end
	end

	def report_hit(player_type)
		if player_type == :human
			print "\nYou scored a hit!"
		elsif player_type == :computer
			print "\nYou've been hit!"
		end

		print " KABLOOIE!\n"
	end

	def report_miss(player_type)
		if player_type == :human
			print "\nYou missed."
		elsif player_type == :computer
			print "\nComputer missed!"
		end

		print " SPLASH!\n"
	end

	def report_sunk(boat)
		if boat.player.type == :human
			print "I sunk your "
		elsif boat.player.type == :computer
			print "You sunk my "
		end

		print "#{boat.name}! GLUG GLUG GLUG...\n"
	end

	def game_won_by(player)
		player.won = true

		print "\n#{player.name} wins!\n"
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

		print_player(board.player, player)

		cursor_to_start

		10.times do |row|
			print_row(board, row)

			advance_down
		end

		print_boats_remaining(board.player) # opponent's boats

		cursor_to_end
	end

	def print_player(opponent, player)
		print "\e[1;15H"
		
		print "#{player.name}'s Turn"
	end

	def cursor_to_start
		print "\e[4;6H"
	end

	def print_row(board, row)
		10.times do |col|
			cell = board.cell_at(row, col)

			if cell.boat != :empty && board.player.type == :human 
				# puts "boat in cell #{cell.boat.name.chr}, player type #{board.player.type}"
				print_boat_type(cell.boat)
			end

			print_status(cell)

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

	def print_status(cell)
		status = cell.hit_status
	
		if status == :hit
			print "X"
		elsif status == :miss
			print "/"
		else
			print "\e[1C"
		end
	end

	def print_boat_type(boat)
		hsh = { "Battleship" => "B", "Carrier" => "C", "Cruiser" => "c", "Destroyer" => "D", "Submarine" => "S"  }

		print "\e[1D"
		print "#{hsh[boat.name]}"
	end

	def print_boats_remaining(player)
		print "\e[3;48H"
		print "  #{player.name}'s Fleet "

		print "\e[4;48H"

		fleet = player.fleet
		line = 4

		fleet.each do |boat|
			print_boat_sunk_status(boat)
			
			if player.type == :human
				print "#{boat_letter(boat.name)}: " 
			else
				print ""
			end

			print "#{boat.name}"

			print "\e[#{line};64H" # move to the 64th space on this line
			print_hit_slashes(boat) if player.type == :human
			
			line += 1
			print "\e[#{line};48H" # move one line down and back to space 48
		end
	end

	def boat_letter(boat_name)
		if boat_name == "Cruiser"
			return "c"
		else
			return boat_name.chr
		end
	end

	def print_hit_slashes(boat)
		boat.hits.times do 
			print "/"
		end
	end

	def print_boat_sunk_status(boat)
		if boat.sunk?
			print "X "
		else
			print "\e[2C"
		end
	end

	def cursor_to_end
		print "\e[25;1H"
	end

	def continue
		sleep(0.3)
		
		print "\nPress enter to continue. "
		gets.chomp
	end

	def print_score(player, stats)
		puts "#{player.name}'s Score\n"

		puts "Shots fired: #{stats[:shots_fired]}"
		puts "Boats sunk: #{stats[:boats_sunk]}"
		puts "Hits: #{stats[:hits]}"
		puts "Misses: #{stats[:misses]}"
	end

	def print_computers(target)
		coords = indices_to_coordinates(target)

		print "(#{coords[0].upcase}, #{coords[1]})"
	end

	def indices_to_coordinates(cell)
		x = cell.row
		y = cell.col

		col = index_to_letter(y)
		row = index_to_number(x)

		[col, row]
	end

	def index_to_letter(index)
		("a".."j").to_a[index]
	end

	def index_to_number(index)
		index + 1
	end

	#################### Input ################

	def user_select_target(board)
		begin
			begin
				print "Please enter coordinates (a letter and a number; e.g. 'a,1')  "
				input = gets.chomp

				return :debug_winner if input == "I win"

				indices = convert_coordinates(input)
				
				row = indices[0]
				col = indices[1]
			end until validate(input) && valid_coordinates(row, col)

			target = board.cell_at(row, col) 
		end until verify_open(target)

		target 
	end

	def validate(input)
		unless input.match? /[a-zA-Z],*\s*\d+/
			puts "Please enter coordinates in the correct format"

			return false
		end

		return true
	end

	def valid_coordinates(row, col)
		if row.is_a?(Integer) && row >= 0 && row < 10 &&
			 col.is_a?(Integer) && col >= 0 && col < 10 
			
			return true
		else
			puts "Please enter valid coordinates."

			return false
		end
	end

	def verify_open(target)
		if target.hit_status == :open
			return true
		else
			print "\nPlease select a square you have not yet fired upon.\n"

			return false
		end
	end

	def convert_coordinates(input)
		number = get_number(input)
		row = convert_number_to_index(number)

		letter = get_letter(input)
		column = convert_letter_to_index(letter)

		[row, column]
	end

	def get_letter(coords)
		coords.match(/\A[a-zA-Z]+/).to_s.downcase
	end

	def get_number(coords)
		coords.match(/(\d+)\s*\z/).to_s
	end

	def convert_letter_to_index(letter)
		columns = ("a".."j").to_a

		columns.index(letter)
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
