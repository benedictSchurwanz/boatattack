class Boat
	attr_reader :name, :length, :hit_points

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

	def place_boat_in(*args)
		args.each do |cell|
			@cells_occupied << cell
		end
	end

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
		names = [nil, "submarine", "destroyer", "cruiser", "battleship", "carrier"]

		names[@length]
	end

	def boat_length
		lengths = {"carrier" => 5, "battleship" => 4, "cruiser" => 3, "destroyer" => 2, "submarine" => 1}

		lengths[@name]
	end
end
