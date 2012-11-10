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

    if button == 1
      space = (@columns[column].last*7)+column
      if !@picked.include?(space)
        @turn+=1
        color = @turn % 2 == 1 ? red : black
        @board[space].style(:fill => color)
        @picked << space
        @columns[column].pop
        if solved?(color)
          alert("#{color} wins!")
        end
      end
    end
  end

  #check if the map is solved
  def solved?(color)
    if horizontal_win(color) || vertical_win(color)
      return true
    else
      return false
    end
  end

  #loop through all rows to see if any given row contains
  # 4 continuous blocks of one color.
  # start at beginning of row, if you hit a different style than
  #  color, there is not a horizontal win on this row.
  #  This is because we need color to be all in a row, you only
  #  start this continuous count after the first color is found
  def horizontal_win(color)
    6.times do |row|
      current_row = @board[(row*7)..(row*7+6)]
      continuous_row_count = 0
      position = 0
      while(position < current_row.length && continuous_row_count != 4) do
        if(current_row[position].style[:fill] == color)
          continuous_row_count += 1
        else
          continuous_row_count = 0
        end
        position+= 1
      end

      if continuous_row_count >= 4
        return true
      end
    end
    false
  end

  #loop through all columns to see if any given column contains
  # 4 continuous blocks of one color.
  # for each column, add 0, 7, 14, 21, 28, 35
  def vertical_win(color)
    7.times do |column|
      current_column = [0,7,14,21,28,35].collect{|num| @board[column+num]}
      current_column = current_column.drop_while{|rect| rect.style[:fill] != color}
      current_column = current_column.take_while{|rect| rect.style[:fill] == color}
      if current_column.count >= 4
        return true
      end
    end
    false
  end

  # 6 total diagonals with length >= 4
  # @board[3][0] -> @board[0][3]
  # until
  # @board[5][3] -> @board[2][6]
  #
  # a Simple way would be to manually count along each diagonal
  def diagonal_win
    6.times do
    end
  end

end
