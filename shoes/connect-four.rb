Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"

  #Build the grid
  4.times do |column|
    rect 200 * column+5,5, 100, 100, :fill => blue
  end

end
