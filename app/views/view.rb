# class View
	# print "\e[x;yH" - moves cursor to line x column y
	# 

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
		print "\n      A     B     C     D     E     F     G     H     I     J\n
   +-----------------------------------------------------------+\n
 1 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 2 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 3 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 4 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 5 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 6 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 7 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 8 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
 9 |     |     |     |     |     |     |     |     |     |     |\n
   |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n
10 |     |     |     |     |     |     |     |     |     |     |\n
   +-----------------------------------------------------------+\n\n"
	end

	def reset_board
		reset_screen
		print_empty_board
	end

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
# end