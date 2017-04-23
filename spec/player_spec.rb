require_relative '../app/models/player'

describe 'Player' do 
	let(:player) { Player.new }

	it 'has boats' do 
		expect(player.fleet).not_to be nil
	end

	it 'has a battleship' do 
		battleship = player.fleet.find { |boat| boat.name == "battleship" }
		expect(battleship.length).to eq 4
	end

	it 'knows how many boats are still afloat' do 
		expect(player.boats_remaining).to eq 7
	end

	it 'knows how many shots it can fire this turn' do 
		expect(player.volley).to eq player.boats_remaining
	end
end
