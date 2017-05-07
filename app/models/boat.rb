class Boat
	attr_reader :name, :length, :hit_points, :player, :cells

	def initialize(args)
		if args[:length] 
			@length = args[:length]
			@name = boat_namer(@length)
		elsif args[:name] 
			@name = args[:name]
			@length = boat_length(@name)
		end

		@player = args[:player]
		@hit_points = @length
		@cells = []
	end

	def occupy(cells)
		@cells = cells if cells.length == @length
	end

	def hit
		@hit_points -= 1 if @hit_points > 0
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

	def boat_namer(length)
		names = [nil, "Submarine", "Destroyer", "Cruiser", "Battleship", "Carrier"]

		names[length]
	end

	def boat_length(name)
		lengths = {"Carrier" => 5, "Battleship" => 4, "Cruiser" => 3, "Destroyer" => 2, "Submarine" => 1}

		lengths[name]
	end
end
