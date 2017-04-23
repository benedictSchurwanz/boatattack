require_relative '../app/models/board'
require_relative '../app/models/cell'

describe Board do 
	let(:board) { Board.new }

	context 'blank board generation' do 
		it 'board has 10 rows and 10 columns' do 
			expect(board.cell_at(0,0)).to be_truthy
			expect(board.cell_at(9,9)).to be_truthy
			expect(board.cell_at(9,10)).to eq nil
			# expect(board.cell_at(10,9)).to raise_error(NoMethodError)
		end
		
		it 'board contains cells' do 
			expect(board.cell_at(1, 1).class).to eq Cell
		end
	end
end
