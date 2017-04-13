def rand_row
	rand(10) + 1
end

def rand_col
	[:a, :b, :c, :d, :e, :f, :g, :h, :i, :j][rand(10)]
end

def rand_dir
	["vertical", "horizontal"][rand(2)]
end
