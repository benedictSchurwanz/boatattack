require_relative 'boat'

class Player
	attr_accessor :board, :fleet

	def initialize
		@board = blank_board
		@fleet = boat_setup
	end

	def boats_remaining
		afloat = 0

		@fleet.each do |name, boat|
			if boat.afloat?
				afloat += 1
			end
		end

		afloat
	end

	private

	def blank_board
		{			
			1 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			2 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			3 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			4 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			5 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			6 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			7 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			8 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			9 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }, 
			10 => { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0, j: 0 }
		}
	end

	def boat_setup
		{ carrier: Boat.new(length: 5),
			battleship: Boat.new(length: 4),
			cruiser: Boat.new(length: 3),
			destroyer1: Boat.new(length: 2),
			destroyer2: Boat.new(length: 2),
			submarine1: Boat.new(length: 1),
			submarine2: Boat.new(length: 1)
		}		
	end
end
