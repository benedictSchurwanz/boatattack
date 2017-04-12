class Cell
	attr_reader :hit_status
	attr_accessor :boat

	def initialize
		@hit_status = '0'
		@boat = 'empty'
	end
end