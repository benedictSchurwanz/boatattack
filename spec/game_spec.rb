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

	context 'boat placement' do 
		let(:test_boat) { Boat.new(length: 3, player: human_player) }
		let(:cell1) { Cell.new(1,1) }
		let(:cell2) { Cell.new(1,2) }
		let(:cell3) { Cell.new(1,3) }

		before(:each) do 
			test_boat.occupy([cell1, cell2, cell3]) 
		end

		it 'knows its location on the board' do 
			expect(test_boat.cells).to include cell3
		end
	end
end
