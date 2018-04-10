require_relative '../app/models/board'
require_relative '../app/models/boat'
require_relative '../app/models/cell'

describe Board do
	let(:board) { Board.new }

	it 'cells can be referenced by coordinates' do
		expect(board.cell_at(3, 4)).to be_a Cell
		expect(board.cell_at(9, 9)).to be_a Cell
	end

	context 'blank board generation' do
		it 'board has 10 rows and 10 columns' do
			expect(board.cell_at(0,0)).to be_truthy
			expect(board.cell_at(9,9)).to be_truthy
			expect(board.cell_at(9,10)).to be_falsey
			# expect(board.cell_at(10,9)).to raise_error(NoMethodError)
		end

		it 'board contains cells' do
			expect(board.cell_at(1, 1)).to be_a Cell
		end
	end

	context 'random cells:' do
		it 'can return a random cell' do
			expect(board.random_cell).to be_a Cell
		end

		it 'can return a random empty cell' do
			empty_cell = board.random_empty_cell

			expect(empty_cell).to be_a Cell
			expect(empty_cell.boat).to eq :empty
		end

		# it 'can return a random occupied cell' do
		# 	submarine = Boat.new(length: 1)
		# 	submarine.occupy([board.cell_at(1,1)])
		# 	board.cell_at(1,1).occupied_by(submarine)

		# 	occupied_cell = board.random_occupied_cell

		# 	expect(occupied_cell).to eq board.cell_at(1,1)
		# 	expect(occupied_cell.boat).to eq submarine
		# end
	end
end
