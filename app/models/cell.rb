class Cell
	attr_reader :hit_status, :boat, :x, :y


	def initialize(x, y)
		# hit status will be :open, :hit, or :miss
		@hit_status = :open
		# boat variable will hold the boat object that is in that spot
		# boat objects will hold an array of cell objects it sits on
		@boat = :empty

		@x = x
		@y = y
	end

	def occupied_by(boat)
		@boat = boat
	end

	def hit
    if @boat != :empty
  		@hit_status = :hit
  		@boat.hit
      return true
    else
      return false
    end
	end

	def miss
    if @boat == :empty
		  @hit_status = :miss
      return true
    else
      return false
    end
	end
end
