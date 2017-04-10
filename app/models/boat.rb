require 'pry'

class Boat
	attr_reader :name, :length, :hit_points

	def initialize(args)
		@length = args[:length]
		@name = boat_namer
		@hit_points = args[:length]
	end

	def sunk?
		@hit_points <= 0
	end

	private

	def boat_namer
		# creating an array such that the index corresponds to the length of the boat
		names = [0, "submarine", "destroyer", "cruiser", "battleship", "carrier"]

		names[@length]
	end
end
