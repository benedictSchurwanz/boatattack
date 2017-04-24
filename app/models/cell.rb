class Cell
	attr_reader :hit_status, :boat, :row, :col

	def initialize(row, col)
		@hit_status = :open # :open, :hit, or :miss
		@boat = :empty # hold the boat object that is in this cell

		@row = row
		@col = col
	end

	def occupied_by(boat)
		@boat = boat
	end

	def hit
    if @boat != :empty && @hit_status == :open
  		@hit_status = :hit
      return true
    else
      return false
    end
	end

	def miss
    if @boat == :empty && @hit_status == :open
		  @hit_status = :miss
      return true
    else
      return false
    end
	end
end
