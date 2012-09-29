
Today we're going to start building a memory game. We're going to do this using Shoes, which uses the Ruby programming language.

The game will have a set of 'cards' on a board. When you click the
cards, the color will change to a 'hidden' color. Your goal will to be
to find all the pairs of two cards with the same color.

The game is a little complicated, so it'll take two sessions to
complete. Today we'll draw cards that we can flip with random colors.


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


### Running your first Shoes program

Start by opening your text editor (TextWrangler on a Mac, or Notepad++ on
Windows).

Start a new file, and save it as "memory.rb".

Now type the following code that tells Shoes to make a window:

	Shoes.app :width => 800, :height => 600 do
	end

Save the file. And now we're ready to run it!

Run the Shoes program that you downloaded earlier. You should see "Welcome to
Shoes". Click on "Open an App." Now find paint.rb that you saved earlier and
open it. You should see your 800x600 window appear.


### Placing the cards

In our game of 'memory', we're going to have a board of 12 cards.
We'll do 4 columns and 3 rows. So if we want 4 columns of cards,
that means they can be at most `800 / 4` (== 200) wide. And
that's only if they're touching! So to give them a little margin,
let's say that they're 100 wide with a 50px border on the sides.

So to draw your first row of cards, type this in your text editor:

```
Shoes.app :width => 800, :height => 600 do
  blue = "#0000FF"

  4.times do |column|
    rect 200 * column + 50, 50, 100, 100, :fill => blue
  end
end
```

Go ahead and run your program in Shoes again, and you should see
a single row of blue square cards.

Next, lets fill out the board by putting in additional rows.
Just like we drew rectangles 4 times for each column in the row,
now we want to draw that row 3 times. Let's make our cards similarly
spaced, with 50px margins on the top.

```
Shoes.app :width => 800, :height => 600 do
  blue = "#0000FF"

  3.times do |row|
    4.times do |column|
      rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
    end
  end

end
```


# Showing the card value

The goal of the game is going to be to pick two cards that are the same
color. For now, let's just work on changing the color of a single bocard
when clicking on it. To change the color of a rectangle, we need to be
able to access it after it's been drawn. So first, let's store the
rectangles we're drawing. Change your drawing loop to look like this:

```
  @cards = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
      @cards << r
    end
  end
```

`@cards = []` means 'set @cards to an empty list`. The square brackets
are like a bucket, and you can place things in there single file. We're
now setting 'r = rect ...', which is just our way of giving the
rectangle we're drawing a name. And finally, '@cards << r' means 'put r
in the list of @cards, at the back of the line'.


Now that we can access the rectangles after they've been drawn, we can
change their style. Try adding this after the 'end' of the '3.times':

```
@cards[2].style(:fill => '#FF0000')
```

If you re-open your shoes program, you'll notice the third card is now
red. Go ahead and experiment with changing the '2' and the fill color.

We can change the color of a card, but we don't want to change just
any card - we want to change the one that we're clicking on. So we're
going to need information about where the mouse is. We're also going to
need to respond to changes as they happen, so we'll do all of this as
part of the 'animation' phase. Go ahead and add this code to the bottom
of the Shoes.app block:


```
  animate do
    button, x, y = self.mouse

    if button == 1
      alert("Mouse is clicked at #{x}, #{y}")
    end
  end
```

If you reopen your app and click around, you'll notice that the first
number gets bigger as you go to the right and the second gets bigger as
you go down. That's because x and y in this case are where the mouse is
on the coordinate system. 'button' is 1 when the mouse button is
clicked.

So, if our goal is to change the color of a specific card, we need to
find out which card we're hovering over, and we can do that with our
coordinates.

Try changing "x" and "y" in the alert to "x / 200" and "y / 200". you
should notice that when we do this, the numbers line up to how many
cards over and down we're clicking on. This is because when we divide
two whole numbers, we're told how many times one goes into the other
without any remainder. That tells us what space on the grid we're in. 

[Ed note: We're going to needto explain how we pick the right card. Do
this on the board with pictures]

That would be great if our cards filled that whole space (show this on
the chalk board). But since they only fill 100 of the 200 pixels, we
need to know where in that range they fit. Our cards have a 50px margin
on both sides, so they exist between the 50th and the 150th pixel in
those squares. To find out where the mouse is, we can look at the
remainder of x / 200. Change the text in the alert to 'x % 200' and 'y % 200' and see what happens.

The '%' symbol is called the 'modulo' operator. It's the way to find out
what's left over. So 202 / 200 would be 1 (there are one 200s in 202). and 202 % 200 would be 2 (there are 2 left over after we take out the 200).

So, in our case, we want what's left over after taking out the 200s to
be between 50 and 150. Let's only change the color if we're within those
bounds:

```
  animate do
    button, x, y = self.mouse

    column = x / 200
    row = y / 200

    if button == 1
      if (50..150).include?(y % 200) && (50..150).include?(x % 200)
        @cards[(4 * row) + column].style(:fill => green)
      end
    end
  end
```

If you play with the app now, you're going to notice that the rectanges
change, but then never change back. That's because we never tell the
rectangle to change back after we stop pressing the mouse button.

Probably the easiest way to do this is to say "If I'm not clicking,
everything should be blue again". So change the animate block to look
like this:


```
  animate do
    button, x, y = self.mouse

    column = x / 200
    row = y / 200

    if button == 1
      if (50..150).include?(y % 200) && (50..150).include?(x % 200)
        @cards[(4 * row) + column].style(:fill => green)
      end
    else
      @cards.each {|c| c.style(:fill => blue)}
    end
```
