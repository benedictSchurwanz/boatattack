require 'pry'

class Boat
	attr_reader :name, :length

	def initialize(args)
		@length = args[:length]
		@name = boat_namer
	end

	private

	def boat_namer
		# creating an array such that the index corresponds to the length of the boat
		names = [0, "submarine", "destroyer", "cruiser", "battleship", "carrier"]

		names[@length]
	end
end
