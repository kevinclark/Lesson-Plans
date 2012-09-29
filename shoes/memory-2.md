
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


```
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


```
  @cards = []
  @colors = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
      @cards << r
      @colors << rgb(rand * 255, rand * 255, rand * 255)
    end
  end
```

And now we'll need to use that color in the animate loop. Change your
animate to look like this:

```
  animate do
    button, x, y = self.mouse

    column = x / 200
    row = y / 200

    if button == 1
      if (50..150).include?(y % 200) && (50..150).include?(x % 200)
        idx = (4 * row) + column
        @cards[idx].style(:fill => @colors[idx])
      end
    else
      @cards.each {|c| c.style(:fill => blue)}
    end
  end
```
