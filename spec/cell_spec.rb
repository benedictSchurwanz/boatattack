require_relative '../app/models/cell'

describe 'cell' do 
	let(:test_cell) { Cell.new }

	it 'knows whether its been hit, starts out open' do 
		expect(test_cell.hit_status).to eq '0'
	end

	it 'knows whether it holds part of a boat' do 
		expect(test_cell.boat).to eq 'empty'
	end
end
