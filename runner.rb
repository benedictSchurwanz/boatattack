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

game.players[:one].fleet.each do |boat|
	puts boat.name
	
	boat.cells.each do |cell|
		puts "(#{cell.x}, #{cell.y})\n"
	end

	puts "\n"
end
