require_relative '../app/models/player'

describe 'Player' do 
	let(:player) { Player.new }

	it 'has boats' do 
		expect(player.fleet).not_to be nil
	end

	it 'has a battleship' do 
		expect(player.fleet[:battleship].length).to eq 4
	end

	it 'knows how many boats are still afloat' do 
		expect(player.boats_remaining).to eq 7
	end

	it 'knows how many shots it can fire this turn' do 
		expect(player.shots).to eq player.boats_remaining
	end
end
