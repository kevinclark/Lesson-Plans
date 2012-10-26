#Connect Four


##(Rough) Outline
* Experiment with table size (building the grid)
> the rows and columns in loops.
> explain rect, the variables we've picked and how picking those will change things
* Clicking in a certain spot changes a color / adds to @board
> explain self.mouse (button, x, y), and the if statements about over_x, over_y
* Keep track of picked "spaces"
> explain how its an index in @board that we're tracking as arrays in @picked
> don't over-draw them with blue
* Experiment with picking colors and setting them as a variable (colorpicker.com)
* Alternate the color that's picked.
* Pick square at bottom of clicked column
> because of our column set of arrays,we know we can take the last element there and multiply
>   it by the total number of rows to get it to the botom position. We then have to offset where that bottom position is
>   based on current "column" from the mouse
> MATH
* how do we alternate picking a color?
> increment @turn and check if it's even or odd
