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
		expect(player_1.board[0].length).to eq 10
	end
end
