require_relative '../app/models/cell'
require_relative '../app/models/boat'

describe 'cell' do 
	let(:test_cell) { Cell.new(0, 0) }
	let(:test_two) { Cell.new(9, 9) }
	let(:test_boat) { Boat.new(length: 5) }


	it 'starts out open' do 
		expect(test_cell.hit_status).to eq :open
	end

	it 'starts out empty' do 
		expect(test_cell.boat).to eq :empty
	end
	
	context 'placing boats in cells' do
		before(:each) { test_cell.occupied_by(test_boat) }
		before(:each) { test_two.occupied_by(test_boat) }

		it 'can hold a boat object' do 
			expect(test_cell.boat).to eq test_boat
		end

		it 'multiple cells can hold the same boat object' do 
			expect(test_two.boat).to eq test_cell.boat
		end
	end

	context 'can be hit or missed' do
		before(:each) { test_boat.occupy([test_cell]) }
		before(:each) { test_cell.occupied_by(test_boat) }

		it 'can be hit if it contains a boat' do 
			test_cell.shoot_at

			expect(test_cell.hit_status).to eq :hit
		end

		it "can't be hit if it doesn't contain a boat" do 
			test_two.shoot_at

			expect(test_two.hit_status).not_to eq :hit
		end

		it 'can be missed if it doesnt contain a boat' do 
			test_two.shoot_at

			expect(test_two.hit_status).to eq :miss
		end

		it "can't be missed if it doesn't contain a boat" do 
			test_cell.shoot_at

			expect(test_cell.hit_status).not_to eq :miss
		end
	end
end
