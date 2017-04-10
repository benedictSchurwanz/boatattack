require_relative '../app/models/boat'

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

	end

	it 'has a sunk status' do 

	end

	xit 'knows its location on the board' do 

	end
end
