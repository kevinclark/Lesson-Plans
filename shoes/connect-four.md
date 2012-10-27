#Connect Four

Today we're going to be taking similar work that we've done in the past and turn
it into a different game. If you were with us a few weeks ago, we built a [memory game](https://github.com/kevinclark/Lesson-Plans/shoes/memory-2.md)
using Shoes, and that's what we're going to also use today. We're going to expand on
the idea of the memory game and begin making another game from it that you can
play with a friend: Connect Four.

Connect Four has a game board thats 6 rows by 7 rows. Generally, pieces are placed at the
top of the board and fall down a column to a first available spot. A player wins when
they get 4 of their color (red or black) in a row (across, up-and-down, or diagonally).

This game is going to be a little much for one session, so we're going to break it into
two sessions. Today we're going to start at understanding how the game board is 
constructed, and work towards placing pieces at a given location. There's room at the
end to go past that, but that's our goal.


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

## Get started with an intro app
```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"

  #Build the grid
  4.times do |column|
    rect 200 * column+5,5, 100, 100, :fill => blue
  end

end
```


# Experiment with table size (building the grid)

Using the code above, we see a simple app. If we run this we generate a few
squares on to the screen and thats all. We're first going to play around with the rows
and columns to generate them to get them how we want them.

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"

  #Build the grid
  4.times do |column|
    rect 200 * column+5,5, 100, 100, :fill => blue
  end

end
```

Play around with the row and column section, we've seen this in the memory game before,
but to give an overview, if we just had the `4.times do |column|` section, we would just
draw a single square 4 times and place them next to each other. We need a way of repeating
this a number of times to make rows.

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  @board = []

  #Build the grid
  6.times do |row|
    7.times do |column|
      r = rect 100 * column + 5,
           100 * row + 5, 100, 100, :fill => blue
      @board << r
    end
  end

end
```

See how it changes the grid and which `times` loop changes which part of the grid.
After we get a good feel of that (setting it to 6 x 7), let's play around with
getting our squares to be how we want them. In memory, we had the squares far away
from each other. However, in Connect Four, we want it to appear as if the squares
are right next to each other.

`r = rect(over_x, over_y, width, height, color)`

As we do this we're also loading them into our @board, just to keep track of where
they are at.
[Ed note: Give another brief overview of arrays. It's like a bucket, the thing inside
of the `[]` is just a way of accessing a certain number of items in the bucket]



# Clicking in a certain spot changes a color / adds to @board

Now, as we have this board, that's not very fun. There's nothing we can do with it
yet! We need to add clicking to start get us in a step towards the idea of dropping tokens
into the columns.

[Ed note: Explain x,y system again. How it's like last weeks class, memory, etc. and
how self.mouse returns 3 things: button, x, and y. and button being set to 1 means that
it was pressed.]

[Ed Note: be careful of `if button == 1` on windows]

```ruby
  animate do
    button, x, y = self.mouse

    if button == 1
      alert("Mouse is clicked at #{x}, #{y}")
    end
  end
```

Now, how do we decide that x and y are on a specific square? Now, as Kevin explained a few 
weeks ago:

Try changing "x" and "y" in the alert to "x / 100" and "y / 100". you
should notice that when we do this, the numbers line up to how many
squares over and down we're clicking on. This is because when we divide
two whole numbers, we're told how many times one goes into the other
without any remainder (integer division). That tells us what space on the grid we're in.

[Ed note: We're going to need to explain how we pick the right square. Do
this on the board with pictures]

```ruby
  animate do
    button, x, y = self.mouse

    column = x / 100
    row = y / 100

    if button == 1
      alert("I have clicked on square: #{column}, #{row}")
    end
  end
```

[Ed note: Whoops! what happens if we click on that free/non-board space? Why does it still say we
clicked on a square? I imagine some smart kids may find this out OR know the answer!]

Now that we know we're within a square, we need to update that specific spot on
the board to know that we're in a square. We can experiment with this by alerting
the column and row to verify this, but let's grab it out of the @board array as well.

```ruby
  animate do
    button, x, y = self.mouse

    column = x / 100
    row = y / 100

    if button == 1
      space = (7 * row) + column)
      @board[space].style(:fill => red)
    end
  end
```
 
That's kind of complicated. What's going on here? Well, if you recall, `@board`
is an array (or bucket) of  42 (0-41) rectangles. We need to pull out of
`@board` the specific square that we clicked on. The way we could even figure out
that there were 42 squares in `@board` was I took the total_rows * total_columns. The
way that we find the square we clicked on is done in a similar fashion.Because we have
rows split after every 7, this is the number we need to multiply the row (y/100) by. Once
we have that, we simply need to walk down the row by column number of steps and change
its color.

[Ed Note: show on the board possibly how the board really is just 42 long rectangles, and
we can skip ahead in steps of 7 to get to new rows because of where it breaks on the 
screen]

Now, that's kind of cool. We could color all sorts of things with this.

[Ed note: Possibly even talk about how if we made the rectangles small enough,
we could draw pixelated pictures, maybe mention how it's like minecraft? haha]


# Experiment with picking colors and setting them as a variable (colorpicker.com)

Up to this point, we've really only used red as our color. But as mentioned in the
begining of the lesson, Connect Four is a game to play with a friend! Let's work on
making two colors.

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  red = rgb(255,0,0)
  black = rgb(0,0,0)

  @board = []
  6.times do |row|
```
We can pick any two colors we really want. Play around with these colors you may want
by going to [colorpicker.com](http://www.colorpicker.com/) and grabbing some colors you'd like to use. Make sure they
are different enough that you can get an idea of who is who.


# Alternate the color that's picked.
Now that we have two colors that we can choose from, we need to tell our game when to 
pick a different color on the mouse click. Let's first save how many turns have passed.

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  red = rgb(255,0,0)
  black = rgb(0,0,0)

  @turn = 0
  @board = []
```

We start this `@turn` variable out at 0 because we're going to count each time we make
a click and place an item.


```ruby
  animate do
    button, x, y = self.mouse

    column = x / 100
    row = y / 100

    if button == 1
      space = (7 * row) + column

      @turn += 1
      if @turn % 2 == 1
        color = red
      else 
        color = black
      end


      alert("The turn count is: #{@turn} and % 2 is #{@turn % 2}")
      @board[space].style(:fill => color)
    end
  end
```

The '%' symbol is called the 'modulus' operator. It's the way to find out
what's left over. So 102 / 100 would be 1 (there is one full 100 in 102),
and 102 % 100 would be 2 (there are 2 left over after we take out the 100).

We're using the modulus operator to keep track of if `@turn` is even or odd. If the
number is odd it will have a remainder (stuff left over) after trying to take as many
2's as it has. Play around with this a bit and get an idea of how the mod is going to 
change after each turn. It should only go between 0 and 1 because any given number
is either going to be even or odd!

# Prevent overwriting a color

The only problem with this now is you can click the same place it overwrites the color.
We need a way to keep track which square has been clicked. One way of doing this is to
store the index of `@board` that has been clicked on, and put it in a new list: `@picked`

```ruby
Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  @board = []
  @picked = []
  @turn = 0
```

Once we create this `@picked` list, we need to start adding numbers into it when we click.

```ruby
    if button == 1
      space = (7 * row) + column

      @turn += 1
      if @turn % 2 ==1
        color = red
      else
        color = black
      end

      @board[space].style(:fill => color)
      @picked << space
    end
```

Now that we're tracking these elements, as we click on the grid we can see that we're
still able to overwrite the other squares. The last step we need to do is ensure we don't
change turn, change color, or fill in a board space if an item has already been picked.

```ruby

    if button == 1
      space = (7 * row) + column

      if !@picked.include?(space)
        @turn += 1
        if @turn % 2 ==1
          color = red
        else
          color = black
        end

        @board[space].style(:fill => color)
        @picked << space
      end
    end
```


# Next
For the next lesson, we'll focus on the following items.

* Pick square at bottom of clicked column
 because of our column set of arrays,we know we can take the last element there and multiply
 it by the total number of rows to get it to the botom position. We then have to offset where that bottom position is
 based on current "column" from the mouse

* Keeping track/updating whos turn it is in text on a side panel
* Reseting the game
* Computing if someone has won or not
