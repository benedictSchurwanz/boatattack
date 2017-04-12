require_relative '../app/models/boat'
require_relative '../app/models/cell'

describe 'Boat' do 
	let(:test_boat) { Boat.new(length: 3) }

	it 'is a boat object' do 
		expect(test_boat).not_to eq nil
	end

	it 'has a name (type of boat)' do 
		expect(test_boat.name).to eq "cruiser"
	end

	it 'has a length' do 
		expect(test_boat.length).to eq 3
	end

	it 'knows how many times it has been hit' do 
		expect(test_boat.hit_points).to eq 3
	end

	it 'has a sunk status' do 
		expect(test_boat.sunk?).to eq false
	end

	it 'knows how many times its been hit' do 
		expect(test_boat.hits).to eq 0
	end

	context 'boat placement' do 
		let(:cell1) { Cell.new }
		let(:cell2) { Cell.new }
		let(:cell3) { Cell.new }

		before(:each) do 
			test_boat.place_boat_in(cell1, cell2, cell3) 
		end

		it 'knows its location on the board' do 
			expect(test_boat.cells).to include cell3
		end
	end
end
