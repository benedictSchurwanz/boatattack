require_relative '../app/models/cell'
require_relative '../app/models/boat'

describe 'cell' do 
	let(:test_cell) { Cell.new }
	let(:test_two) { Cell.new }
	let(:test_boat) { Boat.new(length: 5) }


	it 'knows whether its been hit, starts out open' do 
		expect(test_cell.hit_status).to eq '0'
	end

	it 'knows whether it holds part of a boat' do 
		expect(test_cell.boat).to eq 'empty'
	end
	
	context 'placing boats in cells' do
		before(:each) { test_cell.boat = test_boat }
		before(:each) { test_two.boat = test_boat }

		it 'can hold a boat object' do 
			expect(test_cell.boat).to eq test_boat
		end

		it 'multiple cells can hold the same boat object' do 
			expect(test_two.boat).to eq test_cell.boat
		end
	end
end
