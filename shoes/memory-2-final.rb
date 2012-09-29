Shoes.app :width => 800, :height => 600 do
  blue = rgb(100, 100, 100)

  @cards = []
  @colors = []
  @picked = []
  @done = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50,
           200 * row + 50, 100, 100, :fill => blue
      @cards << r
    end
  end

  6.times { @colors << rgb(rand(255), rand(255), rand(255)) }
  @colors = @colors * 2
  @colors.sort! { rand(3) - 1 }

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
          @picked.uniq!
          if @picked.size > 2
            @picked.shift
          end

          if @picked.size == 2
            if @colors[@picked[0]] == @colors[@picked[1]]
              @done = @done + @picked
              @done.uniq!
            end
          end

          if @done.size == 12
            alert("You win!")
          end
        end
      end
    else
      @cards.each_with_index {|card, space| 
        if !@picked.include?(space) && !@done.include?(space)
          card.style(:fill => blue)
        end
      }
    end
  end
end
