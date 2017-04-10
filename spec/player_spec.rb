require_relative '../app/models/player'

describe 'the board' do 
	let(:player_1) { Player.new }

	it 'has a board' do 
		expect(player_1.board).to be_truthy
	end

	it 'has a board with 10 rows' do 
		expect(player_1.board.length).to eq 10
	end

	it 'has a board with 10 columns' do 
		expect(player_1.board[1].length).to eq 10
	end

	it 'has cells that can be referenced by coordinates' do 
		expect(player_1.board[1][:a]).to eq 0
		expect(player_1.board[10][:j]).to eq 0
	end
end

describe 'Player' do 
	let(:player) { Player.new }

	it 'has boats' do 
		expect(player.fleet).not_to be nil
	end

	it 'has a battleship' do 
		expect(player.fleet[:battleship].length).to eq 4
	end
end
