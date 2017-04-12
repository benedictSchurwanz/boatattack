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
	end
end
