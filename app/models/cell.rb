class Cell
	attr_reader :hit_status, :boat, :x, :y

	def initialize(x, y)
		@hit_status = :open # :open, :hit, or :miss
		@boat = :empty # hold the boat object that is in this cell

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
