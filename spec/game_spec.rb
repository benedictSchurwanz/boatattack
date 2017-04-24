require_relative '../app/models/game'
require_relative '../app/models/boat'
require_relative '../app/models/cell'
require_relative '../app/models/player'

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

	xcontext 'boat placement' do 
		let(:cell1) { Cell.new }
		let(:cell2) { Cell.new }
		let(:cell3) { Cell.new }

		before(:each) do 
			test_boat.place_boat_in(cell1, cell2, cell3) 
		end

		it 'knows its location on the board' do 
			expect(test_boat.cells).to include cell3
		end
	end
end
