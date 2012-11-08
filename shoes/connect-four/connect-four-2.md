# Connect Four Complete
(Summary of last game, where we're going to in this game)

### Prereqs


# Keeping track of columns
* pre fill in the column
* column variable array of arrays
* demo this with showing it on the board?

# Dropping to the bottom of a column (stacks)
[Ed Note: longest pre-lunch section, lunch after?]
* explain poping off a column, chalk board explanation maybe for poping.
* how do we pick the column

# Computing if someone has won or not
* Ask for how some students may want to compute this.
* see if we can direct them towards an easier solution
* took me a while to even figure out in a simple way
* vertical
* horizontal
* diagonal
* * How can we narrow down diagonal? (Dont need to check everywhere!)
* Why are we breaking this out into methods?
* * helps organize thoughts better!
* Ranges in ruby for the ranges
* * Explain the values we use for accessing/looping in @board
* Count can take a block
* could do something like ` @board[(row*7)..(row*7+6)].count{|rect| rect.style == color} >= 4`
  but this wont work for making sure it's all connected / lined up.
* Can't just count the total in that row.
* * what if the color isnt all one after another
* * drop_while
* * take_while


# resetting the game
* button with reset

# keeping track of wins even after a reset

# Updating who's turn it is
* label on the side?
