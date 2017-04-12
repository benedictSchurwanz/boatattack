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




## Game Setup

* create one computer player object and one human player object
* player objects, on initialization, create a blank board filled with empty cells
* place boats in cells 
	* random:
		- start with a boat
			- pick a random spot
			- pick a random direction: vertical or horizontal
			- before placing the boat, check a number of cells equal to the length of the boat, to make sure they're empty
				- always go right if horizontal, down if vertical
					- IF an edge is encountered, or if the cell contains a boat (cell.boat != 'empty'), go to the other end of the boat and start traveling left/up 
					- if at any point a cell is not empty, pick a new direction: vertical or horizontal
					- if the second direction fails to find enough empty cells, pick a new random spot
					- when successful, return an array of the empty cells
				- if there are enough empty spaces, put the current boat object in each of the cells, and put the cell objects in the boat's list of cells
		- continue until all boats are placed

	* need methods: 
		- traverse forward (right/down)
		- traverse backward (left/up)
			- traversal methods: 
				- you could separate the grabbing of the cells, and then pass the cell collection into a checker method
					- grab_forward, grab_backward, empty_checker


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




























