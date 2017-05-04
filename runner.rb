require_relative './app/models/game'

game = Game.new

# p game.players
game.setup

# puts game.players[:one].fleet[0].name
# puts game.players[:one].fleet[0].length
# puts game.players[:one].fleet[0].hit_points
# puts game.players[:one].fleet[0].cells[0].x
# puts game.players[:one].fleet[0].cells[0].y

# puts game.players[:one].fleet[0].cells

# game.players[:one].fleet.each do |boat|
# 	puts boat.name
	
# 	boat.cells.each do |cell|
# 		puts "(#{cell.row}, #{cell.col})\n"
# 	end

# 	puts "\n"
# end

## fires at all cells on player one's board and prints that board
# player = game.players[:one]

# 10.times do |row|
# 	10.times do |col|
# 		target = player.board.cell_at(row, col)

# 		game.fire_on(target) # fire_on method temporarily made public for testing
# 	end
# end

# game.print_current_board(game.players[:one].board, player)
