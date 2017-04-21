class Boat
	attr_reader :name, :length, :hit_points
	attr_accessor :cells

	def initialize(args)
		if args[:length] do 
			@length = args[:length]
			@name = boat_namer
		elsif args[:name] do 
			@name = args[:name]
			@length = boat_length
		end

		@hit_points = @length
		@cells_occupied = []
	end

	# pass in as arguments the list of cells that this boat will occupy
	# TBI: verify that the number of cells is equal to the boat length
	def place_boat_in(*args)
		args.each do |cell|
			@cells_occupied << cell
		end
	end

	# boat has been hit? invoke this method
	def im_hit
		@hit_points -= 1
	end

	def sunk?
		@hit_points <= 0
	end

	def afloat?
		@hit_points > 0
	end

	def hits
		@length - @hit_points
	end

	private

	def boat_namer
		# creating an array such that the index corresponds to the length of the boat
		names = [nil, "submarine", "destroyer", "cruiser", "battleship", "carrier"]

		names[@length]
	end

	def boat_length
		lengths = {"carrier" => 5, "battleship" => 4, "cruiser" => 3, "destroyer" => 2, "submarine" => 1}

		lengths[@name]
	end
end
