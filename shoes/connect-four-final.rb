Shoes.app :width => 900, :height => 625 do
  blue = "#0000FF"
  red = rgb(255,0,0)
  black = rgb(0,0,0)

  @board = []
  @columns = [[],[],[],[],[],[],[]]
  @picked = []
  @turn = 0

  #Build the grid
  6.times do |row|
    7.times do |column|
      r = rect 100 * column+5,
               100 * row+5, 100, 100, :fill => blue
      @board << r
      @columns[column] << row
    end
  end

  animate do
    button, x,y = self.mouse
    column = x / 100
    row = y / 100
    over_x = x % 100
    over_y = y % 100
    if button == 1
      if (5..105).include?(over_x)
        if (5..105).include?(over_y)
          @turn+=1
          color = @turn % 2 == 1 ? red : black
          space = (@columns[column].last*7)+column
          @board[space].style(:fill => color)
          @picked << space
          @columns[column].pop
        end
      end
    end
  end

end
