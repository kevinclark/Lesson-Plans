Shoes.app :width => 800, :height => 600 do
  blue = "#0000FF"
  green = "#00FF00"

  @cards = []

  3.times do |row|
    4.times do |column|
      r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
      @cards << r
    end
  end

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
  end
end
