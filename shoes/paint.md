Today we're going to build a program that lets us paint pictures on the
screen. We're going to do this using Shoes, which uses the Ruby
programming language.


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

Start a new file, and save it as "paint.rb".

Now type the following code that tells Shoes to make a window:

	Shoes.app :width => 800, :height => 600 do
	end

Save the file. And now we're ready to run it!

Run the Shoes program that you downloaded earlier. You should see "Welcome to
Shoes". Click on "Open an App." Now find paint.rb that you saved earlier and
open it. You should see your 800x600 window appear.


### Painting

Now that we've got a canvas, it'd be nice if we could do something with
it. Go ahead and add these lines to your Shoes app, and we'll talk about
them.


    last_x = nil
    last_y = nil

    animate 30 do
      button, x, y = self.mouse

      if button == 1
        line(last_x, last_y, x, y)
      end

      last_x = x
      last_y = y
    end


The goal here is to be able to draw on the canvas. So we tell the
computer, "30 times a second, if I'm holding the mouse button down, I
want you to draw a line from where I was to where I am now". Let's go
over it line by line:

`last_x = nil` and `last_y = nil` is setting up our animation loop. It
means "we didn't have a last position". 'x' traditionally means the
distance to the right or left and 'y' means distance up or down.

`animate 30 do` means "30 times a second, do these set of things".

`button, x, y = self.mouse` is our way of finding out where the mouse
is. button will be 1 or 0, depending on whether it's pressed (1 is
pressed). x and y will be the position of the mouse.

So then we saya "if button == 1" (pressed), draw a line from the last
position to the new position. And then we set the last position to this
position.

Try it!

This works pretty well, but it's not very colorful. Go to
[http://colorpicker.com](http://colorpicker.com) and pick a color that
you like. The description of the color will show up in the text box
above. I'm going to pick "474BC4" which is a color of blue.

Before the line that says "animate 30 do", put this line:


  stroke "#474BC4"


Where the thing inside the quotes is the color you picked, but with a
'#' before it. `stroke` is our way of saying "I want to use this color
to draw".

Try it! Now you can draw with colors by changing that line. It might be
nice to be able to change the color by clicking on the screen though, so
let's make that work.

First, we'll want a place on the screen to pick a color. Let's draw two
rectangles with different colors, and let that be our color picker.

At the top of your shoes app, just below the `Shoes.app` line, add lines
that look like this:

    @green = rect 650, 50, 100, 100, :fill => "#00FF00"
    @blue = rect 650, 200, 100, 100, :fill => "#0000FF"

I've chosen a green and a blue, but you can pick any color you want by
changing the bit in the quotes next to 'fill'. You can put any color
from colorpicker in there that you'd like.

Go ahead and start up your shoes app and make sure this works, and
they'll we'll talk about how it works.

These lines both draw rectangles. The first number after `rect` is how
far to the right to start the rectangle. The second number is how far
from the top to start drawing. The third number is how wide to make the
rectangle and the fourth is how tall to make it.

(teacher prompt)
This is a little easier for me to understand by seeing it, so let's draw
it on the chalkboard.

Now let's make clicking on the rectangles do something. This is going to
look a little complicated, but go ahead and type it in and then we'll
talk about it. When you get to the `stroke` lines, use the color you
picked for the first rectangle for the first line and the color you
picked for the second rectangle for the second line. Notice that my
first one is the same as my green and the second is the same as my blue.


    click do |button, x, y|
      if button == 1

        if (650..750).include? x
          if (50..150).include? y
            stroke "#00FF00"
          end
          if (200..300).include? y
            stroke "#0000FF"
          end
        end

      end
    end


Once this is in, go ahead and try it out.

Now let's go line by line:

`click do |button, x, y|` says "when I click the mouse, do these things,
and tell me whether the mouse button is up or down and where the mouse
is". Next we says `if button == 1`, which you might remember means "if
the mouse button is pressed.

The next section figures out if the mouse is over one of the rectangles.
Both rectangles start at 650 to the right, and are 100 wide. So we say,
is 'x' (the distance of the mouse to the right) included in the numbers
between 650 and 750?

If it is, we need to figure out which rectangle the mouse is over. We do
that by looking at how far down the page the mouse is. Our first
rectangle starts at 50 and is 100 tall, so we say "is the position of
the mouse between 50 and 150 down?" If it is, then we use the `stroke`
word to set the color to the color of the first rectangle. Then we do
the same thing for the second rectangle which starts at 200 and goes for
100 (to 300).



Other things to try:

* Instead of drawing with lines, draw with rectangles.
* Instead of picking colors on the page, randomly change colors.
