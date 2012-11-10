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
It's true we have a fixed number of columns to use for this game, but how might we
go about keeping track of which one contains which space. Certainly, there are ways
to figure this out using `@board`, but why should we make it harder on ourselves
than we need it to be?
[Ed Note: Ask if anyone has any idea how we may do this, perhaps push them in the
direction of using arrays, thinking that an array can also contain arrays. Could
end the questionare with the chalkboard or whiteboard]

We need to first initialize our columns as `@columns` with it containing an empty
array for each column we have.

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  red = rgb(255,0,0)
  black = rgb(0,0,0)

  @board = []
  @columns = [[],[],[],[],[],[],[]]
  @picked = []
  @turn = 0
```

Now that we have `@columns`, let's load it so we can use it. We're going to do
this in a similar manner to the way we did @board.

```ruby
 #Build the grid
  6.times do |row|
    7.times do |column|
      r = rect 100 * column+5,
               100 * row+5, 100, 100, :fill => blue
      @board << r
      @columns[column] << row
    end
  end
```
[Ed Note: Ask kids if they've seen anything like this before, reminding them
that column is just a number. what does this do? DEMO IT ]

Now you're probably wondering, 'why are we only loading numbers into `@columns`?'
The answer of course is math! Sometimes math can be annoying and hard, but I
assure you it won't be too bad!

# Dropping to the bottom of a column (stacks)

We have columns of these numbers, but how can we figure out if we're clicking on
a given column, to drop it in the correct location? We have a column variable when
clicking that could just be used to select the same column in `@columns`. If you
remember from last time (or look at your code), you can remember that `column`
will return to you a number: 0,1,2,3,4,5 or 6. That could be used, like we did
when we were loading `@columns` to select a given column!

But if we pick it, it only has numbers in it, how do these correlate to `@board? If
we take the last number in the list of a column (a 5), and multiply it by 7 (the
total in each row) we will get the last row on the grid! The only thing left to
do after that is ensure we scoot over by the number of columns we're picking.

```ruby
animate do
    button, x,y = self.mouse

    column = x / 100
    row = y / 100

    if button == 1
      space = (@columns[column].last*7)+column
      if !@picked.include?(space)
        @turn+=1
        color = @turn % 2 == 1 ? red : black
```

[Ed Note: Why are we accessing it in this way? Also try to get the kids to notice
this only fills up the last row.]

How can we get this to stop being only the last row? Has anyone heard of a stack?
![A Stack](http://upload.wikimedia.org/wikipedia/commons/2/29/Data_stack.svg).

If we think of our columns as stacks, when we place something in `@board` at the
appropriate space we want to pop that space off. If we do this and remove the 5
in the column we just placed something in, the next time we place a square in
this column, it will be one higher! This makes it seem like we're stacking the
pieces.

```ruby
if button == 1
      space = (@columns[column].last*7)+column
      if !@picked.include?(space)
        @turn+=1
        color = @turn % 2 == 1 ? red : black
        @board[space].style(:fill => color)
        @picked << space
        @columns[column].pop
      end
```

To do this, we just need to call `.pop` on that column! Ruby will take care of
removing the last item for us.


# Computing if someone has won or not

Now that we properly have items dropping to the bottom of the columns we need to
finish up with the best part: finding out if someone has won!

```ruby
 if !@picked.include?(space)
        @turn+=1
        color = @turn % 2 == 1 ? red : black
        @board[space].style(:fill => color)
        @picked << space
        @columns[column].pop
        if solved?(color)
          alert("#{color} wins!")
        end
      end
```

First thing we need to do check after each click if someone has won. What is
`solved?(color)`? It's just our own method that we're defining! The reason we're
doing this is for easier reading and so we don't have to repeat ourselves.

Ruby is pretty neat, in that it can have question marks in the method names. I
decided to use one here because it reads pretty clearly, we're asking the system
if this has been solved yet. 

[Ed Note: Ask students how they'd think to solve this, see if they can see the
mappings of each additional method, and if they can decide to split it into those
methods (diagonal, horizontal, vertical).]

```ruby
        @columns[column].pop
        if solved?(color)
          alert("#{color} wins!")
        end
      end
    end
  end

  #check if the map is solved
  def solved?(color)
    if horizontal_win(color) || vertical_win(color)
      return true
    else
      return false
    end
  end
```
Well, it seems easist to define some additional methods for solving so we can work
on each solution independently. This is just the way that I thought about it, and
it helped me tackle each part separately. Helped others read my code too!

Let's look at vertical first!

### Solving vertically

```ruby
  #loop through all columns to see if any given column contains
  # 4 continuous blocks of one color.
  # for each column, add 0, 7, 14, 21, 28, 35
  def vertical_win(color)
    7.times do |column|
      current_column = [0,7,14,21,28,35].collect{|num| @board[column+num]}
      current_column = current_column.drop_while{|rect| rect.style[:fill] != color}
      current_column = current_column.take_while{|rect| rect.style[:fill] == color}
      if current_column.count >= 4
        return true
      end
    end
    false
  end
```

Wow, lots of code. Let's step through this slowly. We know we need to loop over
all of the columns, and that there's 7 of them. That's easy enough, we've done this
before. We also know that we are looking for a set of 4 in order. This may seem
trivial, but the nature of dropping blocks in actually helps us solve this with
some tricks we'll see. Lastly, we need to know how to get to a given spot on
`@board`, this will be similar to how we did it with `@columns`.

```ruby
  current_column = [0,7,14,21,28,35].collect{|num| @board[column+num]}
```

[Ed Note: See if we can get the students to read this to find out what this line
is doing]

The reason we have the `[0,7,14,21,28,35]` part is because these are the indexes
in `@board` along the first column. The only difference for each column after that
is using our `column` variable from our loop. Sweet, so for each column we know
the indexes of that space in `@board`.

```ruby
  current_column = current_column.drop_while{|rect| rect.style[:fill] != color}
  current_column = current_column.take_while{|rect| rect.style[:fill] == color}
```

[Ed Note: Again with the reading of lines from students, then draw out how
`drop_while` and `take_while` work.]

After we have our current column, we need to start at the top and drop (or remove)
and of the spaces that don't have the color we're looking for. Remember that the
color of the spaces above the one we just dropped are going to be blue, so we 
need to drop those. After this happens, we need to use `take_while` to grab squares
and stop grabbing if we hit one that ISN'T `color`. `take_while` and `drop_while`
have those conditionals inside of a block so that we can loop over all of them, but
it also explains how to behave. We want this stuff until this isnt true anymore.
We've seen while loops before, and this is just like that (probably why it has
'while' in the name!).

We are checking the color of these rectangles a little differently than we've
assigned them in the past. I actually had trouble at this at first and needed to do
some `alert` calls to get an idea of what I was working with.

[Ed Note: Time permitting, show these alert calls out.]

Because of `return true`, it allows us to stop looping through this as we hit a set
of continuous blocks of the same color. If we reach the end of the method we should
return false. We return true or false because of how this method is used as we saw
above: in a conditional.

### Solving horizontally

Now you may be saying "horizontally is easy! It's similar to vertical so we can
use the same idea again!". And this is what I thought too, but I caught a bug at
the last minute that would have made one type of win uncatchable! We can't have
that.

```ruby
  #loop through all rows to see if any given row contains
  # 4 continuous blocks of one color.
  # start at beginning of row, if you hit a different style than
  #  color, there is not a horizontal win on this row.
  #  This is because we need color to be all in a row, you only
  #  start this continuous count after the first color is found
  def horizontal_win(color)
    6.times do |row|
      current_row = @board[(row*7)..(row*7+6)]
      continuous_row_count = 0
      position = 0
      while(position < current_row.length && continuous_row_count != 4) do
        if(current_row[position].style[:fill] == color)
          continuous_row_count += 1
        else
          continuous_row_count = 0
        end
        position+= 1
      end

      if continuous_row_count >= 4
        return true
      end
    end
    false
  end
```
Starts our similar enough. We know how to solve it, and what to look out for. Our
`current_row` is set up a little different though. I think this is a little easier!
What we're doing here is called a range. The `@board` array can take a range as its
indexes. So for each row we're on, we need to multiply by 7 to get to that actual
spot in `@board` and we want the last index to be 7 spots (0 -> 6) from the first.

Now we need to set up some variables to use for this while loop. The reason we need
to use a while loop instead of the way we did before is because of a scenario such
as `[r, b, r, r, r, r]` would not have been caught. We wouldn't have had to drop
any items, then we would have taken our one red, then stopped because the next spot
had a black item in it. Whoops! We need to ensure we loop through the entire row
until we hit a set of 4 or the end of the row. Not too bad.

```ruby
      while(position < current_row.length && continuous_row_count != 4) do
        if(current_row[position].style[:fill] == color)
          continuous_row_count += 1
        else
          continuous_row_count = 0
        end
        position+= 1
      end
```

Using the variables we just described, we can read this out to understand what we
are doing. As we loop through the entire row, we need to either reset 
`continuous_row_count` or add to it and then increment our count (so we can see if
we're at the end of the row or not!).

After we exit this while loop, we'll either have `continuous_row_count >= 4`, or
we're at the end of the row. If our count is right, we should return true.


### Solve Diagonally

What about diagonally? Well, although traditional connect four has wins diagonally,
we don't really have an appropriate amount of time to work on this. So I leave it
to you to solve on your own! Bonus points if you show up next week and it works,
I'll even buy your lunch (maybe).

I have notes on how to start however: 

```ruby

  # 6 total diagonals with length >= 4
  # @board[3][0] -> @board[0][3]
  # until
  # @board[5][3] -> @board[2][6]
  #
  # a Simple way would be to manually count along each diagonal
  def diagonal_win
    6.times do
    end
  end
```

# Time permitting: Bonus items idependent work with mentors.

Those two sections on their own are pretty huge. The rest of the time is going to
be used to explore some additional game features for ourselves. Take advantage of
all of the mentors to help you, or talk to your friends to work together. Anything
goes! 

The [ruby-docs](http://www.ruby-doc.org/core-1.9.3/) can be quite useful for
finding tricks [like take_while in ruby](http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-take_while).
and [shoes examples](http://shoesrb.com/manual/Sample.html) or the [documentation](http://shoesrb.com/manual/Shoes.html).


# Resetting the Game

Once a game as been won, click a button to reset it and all of our variables! We
could do this in the alert to winning OR a stand alone button on the space we have
on the side.

# Keeping Track of Wins Even After a Reset

Simply would be two more variables to keep track of wins. We could also use ruby's
hashes! Use that documentation to figure that out if you want. Also be sure not to
reset these counts if you're resetting all variables when resetting the game.

# Updating who's turn it is

This one is a little one, we already have access to `@turn`. Look into Shoes' docs
on how we can just place text on the screen to keep track of the turn.
