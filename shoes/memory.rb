Shoes.app :width => 800, :height => 600 do
  blue = rgb(100, 20, 45)
  green = "#00FF00"

  @cards = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50,
           200 * row + 50, 100, 100, :fill => blue
      @cards << r
    end
  end

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
          color = rgb(rand() * 255, rand() * 255,
                     rand * 255)
          @cards[space].style(:fill => color)
        end
      end
    else
      @cards.each {|c| c.style(:fill => blue)}
    end
  end
end

