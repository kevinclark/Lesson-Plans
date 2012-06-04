# Graphics and animation

Today, we're going to draw graphics and make some simple animation using a
programming toolkit called Shoes which uses the Ruby programming language.

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

Start a new file, and save it as "Demo1.rb".

Now type the following code that tells Shoes to make a window:

	Shoes.app :width => 800, :height => 600 do
	end

Save the file. And now we're ready to run it!

Run the Shoes program that you downloaded earlier. You should see "Welcome to
Shoes". Click on "Open an App." Now find Demo1.rb that you saved earlier and
open it. You should see your 800x600 window appear.

Now try changing the size of your window. Save the file, then start Shoes
again and open Demo1.rb to see your changes. You can also open your program by
dragging Demo1.rb on to the Shoes app.

### Drawing graphics

Let's start with drawing a face.

First, we'll tell Shoes to make a head. The head is going to be an oval, and
we need to tell Shoes the where to put it and how bit to make it. We'll also
tell Shoes what color to make it.

	Shoes.app :width => 800, :height => 600 do
		@head = oval 225, 45, 400, 500, :fill => "#814BA6"
	end

You can pick the size and position and color that you want. I made my head be
400 pixels wide, 500 pixels tall, 225 pixels from the left of the window, 45
pixels from the top of the window, and colored purple. You can use
[http://colorpicker.com](http://colorpicker.com) to find color values.

Remember, to see your changes, save your file, then start Shoes and open your
file in Shoes.

Let's add some eyes.

	Shoes.app :width => 800, :height => 600 do
		@head = oval 225, 45, 400, 500, :fill => "#814BA6"
		@leftEye = oval 350, 150, 50, 75, :fill => "#D8E8F2"
		@rightEye = oval 450, 150, 50, 75, :fill => "#D8E8F2"
	end

Now let's use some different shapes to finish our face.

	Shoes.app :width => 800, :height => 600 do
		@background = rect 0, 0, 800, 600, :fill => "#2C9E20"
		@head = oval 225, 45, 400, 500, :fill => "#814BA6"
		@leftEye = oval 350, 150, 50, 75, :fill => "#D8E8F2"
		@leftEyeBall = oval 360, 190, 15, 15, :fill => "444444"
		@rightEye = oval 450, 150, 50, 75, :fill => "#D8E8F2"
		@leftEyeBall = oval 460, 190, 15, 15, :fill => "444444"
		@mouth = rect 295, 400, 275, 50, :fill => "#CC4572"
		@nose = star 420, 300, 5, 50, 10, :fill => "#EEEEEE"
		@name = title "George Clooney", :left => 250, :top => 540
	end

Rectangles (rect) take the same number parameters as ovals: left, top, width,
height. Stars (star) takes the following parameters: left, top, number of
points, diameter of the outside points, diameter of the inside points. Drawing
text is a little different: you specify the text first, then you have to tell
it that you are giving it numbers for the left and top.

### Animation

Now we're going to learn how to make our drawings move.

Start by making a new file and saving it as "Demo2.rb". Here's the starting
code to make a window again:

	Shoes.app :width => 800, :height => 600 do
	end

Go ahead and add a shape that we can animate. Put it somewhere in the middle
of the screen.  I'm going to call mine "ball", and make it a circle:

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
	end

Now let's add some animation!

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
	
		animate 30 do
		end
	end

This tells Shoes to run an animation, but it doesn't tell it what to do when
then animation runs.  Let's add some code to move the ball.

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
	
		animate 30 do
			@ball.top += 5
		end
	end

Now Shoes will move the top of the ball down by 5 pixels 30 times every
second. See if you can make the ball move up and to the left or right also.
You can also try adding more shapes and making them all move at the same time.

You may be familiar with "if" statements from previous programming lessons. We
can use an "if" statement to stop the ball from moving off the screen.

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
	
		animate 30 do
			if @ball.top < 500
				@ball.top += 5
			end
		end
	end

Now Shoes only moves the ball if it's top is less than 500, so the ball will
stop when it's top gets to 500. I know that the height of the ball is 100, so
that will mean that the bottom of the ball will be at 600, right at the bottom
of the screen. We could also write "`if @ball.top + @ball.height < 600`" to
make Shoes do the calculation for us.

### Using Mouse input

Now let's learn how to respond to mouse clicks in our program.

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
	
		animate 30 do
			if @ball.top + @ball.height < 600
				@ball.top += 5
			end
		end
	
		click do |button, x, y|
			@ball.left = x - 50
			@ball.top = y - 50
		end
	end

Shoes will run the `click` block whenever the mouse is clicked in our window.
When this happens there are three pieces of information you can use in your
code: `x` and `y` are the pixel positions of where the mouse was clicked, and
`button` is a number that tells which mouse button was clicked.

In the code above, I've made clicking the mouse move the ball to where the
mouse was clicked. I subtracted 50 (half the width and height) so that the
center of the ball will go where the mouse was pointing.

### Using variables for advanced animation

In the examples above, we've used variables (like `@ball`) to store the shapes
we've created. We can also use variables to store numbers that we can use to
do more complicated animations. Let's make a variable to hold the current
speed of the ball so that we can make a bouncing animation.

	Shoes.app :width => 800, :height => 600 do
		@ball = oval 350, 250, 100, 100, :fill => "#789789"
		@ballSpeed = 0
	
		animate 30 do
			@ball.top += @ballSpeed
			@ballSpeed += 1
			if @ball.top + @ball.height > 600
				@ballSpeed = -@ballSpeed
			end
		end
	
		click do |button, x, y|
			@ball.left = x - @ball.width/2
			@ball.top = y - @ball.height/2
			@ballSpeed = 0
		end
	end

Here's how the bouncing works: we keep a variable (`@ballSpeed`) that tells
how fast the ball is moving. On each step of the animation, we move the ball
by however much the speed is (the faster the speed is, the farther the ball
will move). Then we add to the speed (this simulates gravity). Then we check
if the ball has hit the bottom of the screen, and if it has, we make the speed
negative so that it will start going up (simulating the bounce).

### Challenge Problems

That's the end of the lesson!  Here are a few challenging things you can try on your own (or with the help of another programmer).

* Make several shapes all bounce on the screen
* Make a shape that bounces off the left, right, or top of the screen
* Make a mouse click control several different shapes
* Make a shape that flies off the screen and enters from the other side
* Make a shape that flies around in the middle of the screen without bouncing
  off the edges