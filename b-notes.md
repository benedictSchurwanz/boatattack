# Battleship

board: 10x10 - array? hash would allow storage of hit/miss/empty in each cell. could do array of hashes
?- could do a hash of hashes, to store the coordinates in form "A", "B", etc

information needed to be stored in each cell: 
	- boat type (or empty)
	- hit (X), miss (/), not-yet-hit (0)
	* could make a "cell" object

ships: 					length
	- 1 carrier 		(5)
	- 1 battleship 	(4)
	- 1 cruiser 		(3)
	- 2 destroyers 	(2)
	- 2 submarines 	(1)

boat object needs to know:
	- length
	- type of boat
	- how many hits
	- how many un-hit sections (hit-points remaining: health)
	- where it is on the board (what cells does it occupy)
boat behavior: 
	- sunk? - notify player boat is sunk

player object needs to know: 
	- how many boats are still alive - how many shots I have
	- how many opponent boats are still alive
	- its own board and the boats on it

a game is composed of turns

number of shots per turn is equal to number of boats player has in play


## Different objects

* Game object

* Turn objects - array of turns inside the game?
	- one turn has two players

* Player object
	- Board attribute

* Cell objects

* Boat objects


#### misc notes

	# old style columns [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]


## Game Setup

* create one computer player object and one human player object
* player objects, on initialization, create a blank board filled with empty cells
* place boats in cells 
	* random now, manual TBI

	* need methods: 
		- traverse forward (right/down)
		- traverse backward (left/up)
			- traversal methods: 
				- you could separate the grabbing of the cells, and then pass the cell collection into a checker method
					- grab_forward, grab_backward, empty_checker


### Boat Placement Algorithm

* random:
	- start with a boat
		- pick a random spot
		- pick a random direction: vertical or horizontal
		- before placing the boat, check a number of cells equal to the length of the boat, to make sure they're empty
			- always go right if horizontal, down if vertical
				- IF an edge is encountered, or if the cell contains a boat (cell.boat != :empty), just pick a new spot
				- when successful, return an array of the empty cells
			- if there are enough empty spaces, put the current boat object in each of the cells, and put the cell objects in the boat's list of cells
	- continue until all boats are placed

* steps: 
	- pick a boat (iterate thru boat list)
	- pick a random empty cell (random_empty_cell)
	- check if boat will fit horizontally (boat_will_fit?(horizontal = true))
		- if not horizontally, check vertically (boat_will_fit?(horizontal = false))
		- if not vertically, new cell (step 2)
	- collect cells in question into an array (collect_cells)
	- check if all cells are empty (cells_are_empty?(cells))
		- if not, new cell (step 2)
	- put the cells array in the boat (also place_boat)
	- put boat in each of the cells in the array (place_boat)
	- start again with the next boat (step 1)


## Gameplay

* tell player how many shots they have available this turn
	- based on how many boats they have alive - ask Player object

* Ask player which cell to shoot
	- record cell chosen by player

* check cell chosen by player
	- if cell has been fired upon (contains a Hit or Miss) ask player to chose another cell
	- check cell for whether it contains a boat
		- if contains a boat:
			- tell boat it has been hit (and possibly also where it was hit)
			- tell cell to record a Hit
			- tell player they scored a Hit
			- ask boat if it has been sunk:
				- if sunk:
					- tell player which boat they sunk
					- does anything else need to happen to the boat?
				- if not sunk:
					- don't need to do anything
		- elsif does not contain a boat:
			- tell cell to record a Miss
			- tell player they missed
		- else: error of some kind?

* if they have shots left:
		- decrement remaining shots, ask for next cell to shoot
	- if no shots left, end their turn



## Views for turns

	- print the blank board
	- iterate through the stored board, print X if hit, / if miss, blank space if open
	- need a method to move to a new row, 
	- one to move forward to the next square until the end
		- needs to either check if the next square is a valid square, or check if the current square is a valid square. Could just check the index. Index should be checked outside the method by the method that is stringing these together. It could iterate from 0-9 and then do the next row, until row 9 is reached. 



* debug user_select_target
	begin
		loop do 
			print "enter coords"
			input = gets.chomp

			break if !validate(input)
			...
				def validate(input)
					if input doesn't match this pattern ...



## Computer AI improvement

*	shoot in a pattern
	- diagonal lines, every other square
		- random squares within the lattice pattern
		- continue until all odd squares are shot at, 
		- then do even squares
	- other patterns?

* when scored a hit
	- shoot up, right, left, down to find the rest of the boat
	- when another hit is scored, continue in that direction
	- repeat until miss
	- resume the shooting pattern



### Firing patterns

	- could create an array (or list?) of cells in random order on the given pattern

* Diagonal lines
	- add coordinate indices, result is even or odd
		- run thru all evens, then all odds
















