# Battleship

## Summary

In this challenge, we'll model a simple real-world system in Ruby code.  We're going to build an interactive command-line game of Battleship.  The full rules are on [wikipedia](http://en.wikipedia.org/wiki/Battleship_\(game\)), but here's an abridged version from [Samuel Bednar](http://en.wikipedia.org/wiki/File:Battleships_Paper_Game.svg):

- The game is played between two players (one human, one computer).
- Each player has a 10 x 10 board with columns labeled 1 - 10 and rows labeled A - J (see file `board.txt`). 
- Players have their own fleets of ships and arrange them on their own boards.
- Players take turns firing on their opponent's ships, taking as many shots per turn as the number of their unsunk ships.
- Shot locations are called out by referencing board coordinates (e.g., "A3", "B6", etc).
- On a board, shots that miss are represented with a `/` and hits are represented with an `X`.
- Opponents must be alerted when a ship is sunk completely.
- Ships are sunk when they've been hit a number of times equal to their size (i.e., the opponent has fired on each board location occupied by the ship).

*Note:* We might be more familiar with a different rule variant than the one described.


### Fleet of Ships

| Ship       | Size | Quantity |
| :--------- | ----:| --------:|
| Carrier    | 5    | 1        |
| Battleship | 4    | 1        |
| Cruiser    | 3    | 1        |
| Destroyer  | 2    | 2        |
| Submarine  | 1    | 2        |

*Table 1*.  Details for ships in each player's fleet.

Different versions of the game use differently sized fleets.  For this challenge, we can use the ships listed in Table 1 or another variant.  But, each player should use the same fleet.


## Releases
### Release 0: Placing Ships
Before players can begin firing on each other's fleets, they need to position their fleets on their respective boards.  Both players—human and computer—should position their fleets of ships on a board.

The computer player's fleet should be placed automatically.  The human player should be able to place ships manually or choose to have the fleet placed automatically.


### Release 1:  Gameplay
Once the fleets have been placed on the boards, the players can begin firing salvos at each other—first one player and then the other.

In turn, players identify the locations on the opponent's board where they are firing.  A player identifies a number of locations upon which to fire equal to the number of remaining ships in the player's fleet.  If a player has three ships remaining, three locations are identified.  After all of the locations have been identified, the player is notified of hits and misses.

We'll have to control how the computer plays; the computer player will need to identify locations upon which to fire.  To begin, the computer doesn't need to be an expert player—let's just get it to fire shots.


###Release 2 :  Winning the game

- The user should be notified when they have sunk one of their opponent's ships.
- When the user has sunk all of their opponent's ships, they win the game.

###Release 3 :  Refactoring

Refactor your code. Some questions to ask yourself:

- Is it DRY?
- Are the methods and variables appropriately named?
- Does it utilize appropriate data structures?
- Is there proper commenting?
- Is it concise and comprehensible?

###Release 4 : Add features (optional)

- Fleet has 7 ships, adding both a submarine and a destroyer.
- User can play against another user.
- Computer can play against itself.
- Computer is somewhat intelligent (i.e. it knows to cluster shots near a hit until a ship is sunk).

<!-- ##Optimize Your Learning -->

##Resources
