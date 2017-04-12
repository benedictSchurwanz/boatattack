class Cell
	attr_reader :hit_status
	attr_accessor :boat

	def initialize
		# hit status will be '0' for not-yet-attacked, 
		# 'X' for hit and '/' for missed
		@hit_status = '0'
		# boat variable will hold the boat object that is in that spot
		# boat objects will hold an array of cell objects it contains
		@boat = 'empty'
	end
end