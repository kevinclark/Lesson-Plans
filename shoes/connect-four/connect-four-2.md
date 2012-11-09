# Connect Four Complete
Today we're going to finish (or get as close as possible) to finishing the
connect-four game we started building last time. Last time as we were building
the game we got as far as having our game grid, making it clickable, and changing
the color on a square that wasnt picked already with 2 alternating colors.

In today's session we're going to focus on two main things: "dropping" the piece
to the bottom of a column with stacking, and calculating if our game is finished. 
Time permitted we have some additional items that students will be encouraged to
work on in a more free-style type class.


### Prereqs - Installing Shoes and a text editor

On windows, download and unzip **Shoes 3 +video for Windows**
* [http://github.com/downloads/shoes/shoes/shoes3.exe.zip](http://github.com/downloads/shoes/shoes/shoes3.exe.zip)

Download and install **Notepad++**
* [http://download.tuxfamily.org/notepadplus/6.1.3/npp.6.1.3.Installer.exe](http://download.tuxfamily.org/notepadplus/6.1.3/npp.6.1.3.Installer.exe)

#### Mac OSX

On Mac OSX 10.6 (Snow Leopard) and 10.7 (Lion), download **Shoes 3**.
Open the dmg file, and copy the Shoes app to your computer.
* https://github.com/downloads/shoes/shoes/shoes-3.1.0.dmg

Download and open **Text Wrangler**
* http://ash.barebones.com/TextWrangler_4.0.1.dmg

*NOTE* Windows users cannot do alert inside of an animate block. change `animate do`
to `click do` or `if button == 1` calls to a `click do` call

### Previous instructions
If you weren't with us last time, that's ok! You can download a copy of the code
we used last time [here](https://github.com/brntbeer/Lesson-Plans/blob/master/shoes/connect-four.rb).

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
* * * Could either chain these commands together, or instead of reassigning, use `take_while!` and `drop_while!`
* * * also talking points about how i found these methods and discovered they
worked for me would be useful


# resetting the game
* button with reset

# keeping track of wins even after a reset

# Updating who's turn it is
* label on the side?
