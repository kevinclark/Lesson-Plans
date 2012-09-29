
Today we're going to finish building a memory game we started last time.
We're going to do this using Shoes, which uses the Ruby programming language.

The game has a set of 'cards' on a board. When you click the
cards, the color will change to a 'hidden' color. Your goal will to be
to find all the pairs of two cards with the same color.

We got as far as drawing cards and seeing the hidden color last time.
If you don't have that available, or weren't here last time, you can
download a copy [here](https://github.com/kevinclark/Lesson-Plans/blob/master/shoes/memory-2.rb).



### Prereqs - Installing Shoes and a text editor


#### Windows

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


# Try out what's there

Run the Shoes program that you downloaded earlier. You should see "Welcome to
Shoes". Click on "Open an App." Now find the ruby file that you saved earlier and
open it. You should see 12 cards show up. Click them and see that they
flip.

# Generating colors

Now that we can show what color a card is underneath, the game would be
a lot more interesting if there was more than one color, so let's talk
about how to pick colors.

You've seen that if we know how to describe a color in 'hex', we can use
that directly. We're doing it with green and blue right now. But what if
we wanted to pick a random color?

Shoes has a method called 'rgb' that lets you put in numbers and get a
color our.

Try changing the line that says `blue = "#0000FF"` to
`blue = rgb(100, 100, 100)` and see what happens. After you've done
that, change some of the numbers that are being passed to rgb.


If we want to pick a random number for the color, we can use the 'rand'
method. 'rand' is going to return a number between 0 and 1. Let's see
what that looks like - add this to your shoes app at the top:

`alert("Is it random? #{rand}")`

If you open it a few times, you'll notice the number changes. Let's use
this to generate some new colors. Change your animate loop to look like
this:


```ruby
animate do
  button, x, y = self.mouse

  column = x / 200
  row = y / 200

  if button == 1
    if (50..150).include?(y % 200) && (50..150).include?(x % 200)
      color = rgb(rand * 255, rand * 255, rand * 255)
      @cards[(4 * row) + column].style(:fill => color)
    end
  else
    @cards.each {|c| c.style(:fill => blue)}
  end
end
```

Now click a block and find out what happens.

You'll notice that now the block color is changing rapidly. This is
happening because we're picking a random color every time. Instead, we
really just want to pick it once for each card. Let's create a new list
of colors for the cards, so we know what each card 'is'.


Change the loop where we draw the cards the first time to look like
this:


```ruby
@cards = []
@colors = []

3.times do |row|
  4.times do |column|
    r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
    @cards << r
    @colors << rgb(rand(255), rand(255), rand(255))
  end
end
```

And now we'll need to use that color in the animate loop. Change your
animate to look like this:

```ruby
animate do
  button, x, y = self.mouse

  column = x / 200
  row = y / 200

  if button == 1
    if (50..150).include?(y % 200) && (50..150).include?(x % 200)
      space = (4 * row) + column
      @cards[space].style(:fill => @colors[space])
    end
  else
    @cards.each {|c| c.style(:fill => blue)}
  end
end
```

Go ahead and start up the program and if you click around,
you'll notice that we've created 12 different colors.
If we want to be able to match anything, we'll need to have
doubles. So pull that line where you create a color out of
those loops, and instead just pick 6 colors, like this:


```ruby
6.times { @colors << rgb(rand(255), rand() * 255, rand * 255) }
```

We've picked 6, so now let's double the number we have. We can
do this like so:

```ruby
@colors = @colors * 2
```

Now when you start it up, you should see two of each color. Since the
board is right, it's time to make the game work. We want to be able to
turn two cards up together, and if they're the same, leave them up.


# Flipping two at a time

So the first requirement is that you should be able to have two
cards up at the same time. Right now you click on a card, and as soon as
you let go, it flips back over. We want to keep track of which cards
have been flipped, and not flip them back until a new card has been
chosen.

Change the section inside the 'button == 1' clause to look like this:

```ruby
animate do 
  button, x, y = self.mouse
  column = x / 200
  row = y / 200
  over_x = x % 200
  over_y = y % 200
  if button == 1
    if (50..150).include?(over_x)
      if (50..150).include?(over_y)
        space = (4 * row) + column
        @cards[space].style(:fill => @colors[space])
        @picked << space
      end
    end
  else
    @cards.each_with_index {|card, space| 
      card.style(:fill => blue) if !@picked.include?(space)
    }
  end
end
```

First we make `@picked` an empty array. Then we add the space picked to
`@picked`. And finally we say that we're only going to change the style
of the card if `@picked` doesn't include the space.

Now we can flip more than one card - but they all stay flipped. Instead,
we want to make it so that when there are more than two cards, the
oldest one gets removed. We can do this by "shifting" the oldest item
off the array.

[ Ed note: Do this on the board ]

Add this after you store the picked space:

```ruby
if @picked.size > 2
  @picked.shift
end
```

This is better, but you might notice that if you click on the same
card twice, the other card goes away. That's because when you click the
second time, it's adding the same card to the list of picked items. If
you don't want this to happen, we need to get rid of that double. We can
do that with ruby's `uniq!` method. Before the check for `@picked.size`,
add this line:

```ruby
@picked.uniq!
```

Now that we can flip two at a time, we want to make matches stay
flipped.

# Keeping the matches

We're going to do this the same way as we made the picked cards stay
flipped - we're going to keep track of matches, and not flip those back
over. When we say two spaces match, what we mean is that they have the
same color. If they have the same color, we want to add those spaces to
the list of spaces that shouldn't be flipped. These spaces are 'done'.

So create a new list called `@done`:

```ruby
@done = []
```

Add the spaces to the list if there are two cards with the same color:

```ruby
if @picked.size > 2
  @picked.shift
end


if @picked.size == 2
  if @colors[@picked[0]] == @colors[@picked[1]]
    @done = @done + @picked
  end
end
```

Now we'll need to change our flip code to skip spaces in `@done`:

```ruby
@cards.each_with_index {|card, space| 
  if !@picked.include?(space)
    if !@done.include?(space)
      card.style(:fill => blue)
    end
  end
}
```

Cards will stick now when they're matched, so you'll probably notice
that they just repeat in the same order every time. Let's shuffle them.
We can do this by sorting in a random order. There's a method called
sort! that can do this for us. With sort!, we give it a block of code to
run, and it gives that block of code two items to compare. The
block's job is to say whether the first is greater than,
equal to, or less than the second. The block says that by replying -1,
0, or 1. In our case, we want to reply randomly. The `rand` method, when
given a number, will pick an integer between 0 and 1 less than that
number. So if we use `rand(3)` and subtract 1, we should get -1s, 0s and
1s.

Change the color generating code to have this additional line:

```ruby
6.times { @colors << rgb(rand(255), rand(255), rand(255)) }
@colors = @colors * 2
@colors.sort! { rand(3) - 1 }
```

Awesome.

Finally, we should congratulate ourselves when the game is finished. We
know we're finished when 12 spaces have been selected. Add this after
where you added to `@done`:

```ruby
if @done.size == 12
  alert("You win!")
end
```

Play around with it. You might notice that if you click on already
matched spaces more than once, you'll get a 'you win' early - to
eliminate this, you can use the same `uniq!` trick that we used on
`@picked`.

```ruby
if @picked.size == 2
  if @colors[@picked[0]] == @colors[@picked[1]]
    @done = @done + @picked
    @done.uniq!
  end
end
```
