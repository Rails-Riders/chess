class Knight < Piece

  def valid_move?(new_x, new_y)
    false if x_position == new_x
    false if y_position == new_y

    (x_position - new_x).abs + (y_position - new_y).abs == 3
  end
end