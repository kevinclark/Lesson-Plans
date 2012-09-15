Shoes.app :width => 800, :height => 600 do
  blue = "#0000FF"

  4.times do |column|
    3.times do |row|
      rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => blue
    end
  end

end
