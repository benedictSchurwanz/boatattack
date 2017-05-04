require_relative '../app/models/player'

describe 'Player' do 
	let(:player) { Player.new(name: "Joe", type: :human) }

	it 'has a name' do 
		expect(player.name).to eq 'Joe'
	end

	it 'has a type' do 
		expect(player.type).to eq :human
	end

	it 'has boats' do 
		expect(player.fleet[0]).to be_a Boat
	end

	it 'has a battleship' do 
		battleship = player.fleet.find { |boat| boat.name == "battleship" }

		expect(battleship.length).to eq 4
	end

	it 'knows how many boats are still afloat' do 
		expect(player.boats_remaining).to eq 7
	end

	it 'knows how many shots it can fire this turn' do 
		expect(player.volley_size).to eq player.boats_remaining
	end

	it 'defaults to Bednar fleet' do 
		expect(player.fleet[0].length).to eq 5
		expect(player.fleet[1].length).to eq 4
		expect(player.fleet[2].length).to eq 3
		expect(player.fleet[3].length).to eq 2
		expect(player.fleet[4].length).to eq 2
		expect(player.fleet[5].length).to eq 1
		expect(player.fleet[6].length).to eq 1
		expect(player.fleet[7]).to be nil
	end
end
