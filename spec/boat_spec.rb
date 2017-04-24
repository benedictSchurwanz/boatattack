require_relative '../app/models/boat'
require_relative '../app/models/cell'

describe 'Boat' do 
	let(:test_boat) { Boat.new(length: 3) }

	context 'just after setup:' do
		it 'is a boat object' do 
			expect(test_boat).to be_a Boat
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
	end

	context 'after shot at:' do 
		before(:each) { test_boat.hit }

		it 'has correctly reduced hit points' do 
			expect(test_boat.hit_points).to eq 2
		end

		it 'has correct hits total' do 
			expect(test_boat.hits).to eq 1
		end

		it 'not sunk with positive hit points' do 
			expect(test_boat.sunk?).to be false
		end
	end

	context 'upon sinking:' do 
		before(:each) { 3.times { test_boat.hit } }

		it 'has 0 hit points' do 
			expect(test_boat.hit_points).to eq 0
		end

		it 'has correct hits total' do 
			expect(test_boat.hits).to eq 3
			expect(test_boat.hits).to eq test_boat.length
		end

		it 'has correct sunk status' do 
			expect(test_boat.sunk?).to be true
		end

		it 'cannot have negative hit points' do 
			test_boat.hit 

			expect(test_boat.hit_points).to be 0
			expect(test_boat.hits).to be 3
		end
	end
end
