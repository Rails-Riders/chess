class Knight < Piece

  def valid_move?(new_x, new_y)
    x_move = (x_position - new_x).abs
    y_move = (y_position - new_y).abs

    (x_position == 2 && y_position == 1) || (x_position == 1 && y_position == 2)

  end

end