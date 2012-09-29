Shoes.app :width => 800, :height => 600 do
  blue = rgb(100, 100, 100)
  green = "#00FF00"

  @cards = []
  @colors = []
  @picked = []
  @done = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
      @cards << r
    end
  end

  6.times { @colors << rgb(rand(255), rand(255), rand(255)) }
  @colors.push(*@colors)
  @colors.sort! {|x, y| rand(3) - 1 }


  animate do
    button, x, y = self.mouse

    column = x / 200
    row = y / 200

    if button == 1
      if (50..150).include?(y % 200) && (50..150).include?(x % 200)
        idx = (4 * row) + column
        @cards[idx].style(:fill => @colors[idx])
        @picked << idx
        @picked.uniq!
        if @picked.size > 2
          @picked.shift
        end
        if @picked.size == 2 && @colors[@picked[0]] == @colors[idx]
          @done.push(*@picked)
          @picked = []
        end
        if @done.size == 12
          alert("You win!")
        end
      end
    else
      @cards.each_with_index {|c, i| 
        if !@picked.include?(i) && !@done.include?(i)
          c.style(:fill => blue)
        end
      }
    end
  end
end
