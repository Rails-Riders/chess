class Queen < Piece
  def valid_move?(dest_x, dest_y)
    # Guard against obstructions
    return false if is_obstructed?(dest_x, dest_y) == true

    # Get the piece's starting coordinates
    start_x = self.x_position
    start_y = self.y_position

    # Get the difference between the starting and ending x and y coordinates
    delta_x = (start_x - dest_x).abs
    delta_y = (start_y - dest_y).abs
    
    if start_y == dest_y || start_x == dest_x || delta_x == delta_y
      true
    else
      false
    end
  end
end