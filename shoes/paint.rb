Shoes.app :width => 800, :height => 600 do
    green = "#00FF00"
    blue = "#0000FF"

    rect 650, 50, 100, 100, :fill => green
    rect 650, 200, 100, 100, :fill => blue

    last_x = nil
    last_y = nil

    click do |button, x, y|
      if button == 1
        if (650..750).include? x
          if (50..150).include? y
            stroke green
          elsif (200..300).include? y
            stroke blue
          end
        end
      end
    end

    animate 30 do
      button, x, y = self.mouse

      if button == 1
        line(last_x, last_y, x, y)
      end

      last_x = x
      last_y = y
    end
end

