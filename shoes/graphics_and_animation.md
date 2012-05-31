# Graphics and animation

Today, we're going to draw graphics and make some simple animation using a
programming toolkit called Shoes which uses the Ruby programming language.

### Prereqs - Installing Shoes and a text editor


#### Windows

On windows, download and unzip *Shoes 3 +video for Windows*
[http://github.com/downloads/shoes/shoes/shoes3.exe.zip](http://github.com/downloads/shoes/shoes/shoes3.exe.zip)

Download and install Notepad++
[http://download.tuxfamily.org/notepadplus/6.1.3/npp.6.1.3.Installer.exe](http://download.tuxfamily.org/notepadplus/6.1.3/npp.6.1.3.Installer.exe)

#### Mac OSX

On Mac OSX 10.6 (Snow Leopard) and 10.7 (Lion), download *Shoes 3*
https://github.com/downloads/shoes/shoes/shoes-3.1.0.dmg
Open the dmg file, and copy the Shoes app to your computer.

Download and open *Text Wrangler*
http://ash.barebones.com/TextWrangler_4.0.1.dmg


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
		@nose = star 420, 300, 5, 50, 10, :fill => "#EEEEEE", :rotate => 25
		@name = title "George Clooney", :left => 250, :top => 540
	end

Rectangles (rect) take the same number parameters as ovals: left, top, width,
height. Stars (star) takes the following parameters: left, top, number of
points, diameter of the outside points, diameter of the inside points. Drawing
text is a little different: you specify the text first, then you have to tell
it that you are giving it numbers for the left and top.
