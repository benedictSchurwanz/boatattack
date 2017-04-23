require_relative '../app/models/game'
require_relative '../app/models/boat'
require_relative '../app/models/cell'
require_relative '../app/models/player'
require_relative '../app/helpers/rand_helpers'

describe 'game setup' do 
	let(:human_player) { Player.new(type: :human) }
	let(:computer_player) { Player.new(type: :computer) }

	context 'player initialization' do 
		it 'can create a human player' do 
			expect(human_player.type).to eq :human
		end

		it 'can create a computer player' do 
			expect(computer_player.type).to eq :computer
		end

		it 'creating a Game creates players' do 
			game = Game.new

			expect(game.players[:one].type).to eq :human
			expect(game.players[:two].type).to eq :computer
		end
	end

	context 'random boat placement' do 
		xit 'can pick a random spot on the board' do 
			expect(computer_player.board.random_cell.boat).to eq :empty
		end
	end
end
