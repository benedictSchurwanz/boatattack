class Cell
	attr_accessor :hit_status
	attr_accessor :boat

	def initialize(x, y)
		# hit status will be 'open', 'hit', or 'miss'
		@hit_status = 'open'
		# boat variable will hold the boat object that is in that spot
		# boat objects will hold an array of cell objects it sits on
		@boat = 'empty'

		@x = x
		@y = y
	end

	def occupied_by(boat)
		@boat = boat
	end
end