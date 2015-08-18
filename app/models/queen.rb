class Queen < Piece
  def valid_move?(dest_x, dest_y)
    # Guard against a destination matching a piece's current location
    return false if [dest_x, dest_y] == [self.x_position, self.y_position]

    # Guard against a destination that is outside a chessboard's grid
    return false if dest_x < 1 || dest_x > 8
    return false if dest_y < 1 || dest_y > 8
    
    # Guard against obstructions
    return false if is_obstructed?(dest_x, dest_y) == true

    # Get the piece's starting coordinates
    start_x = self.x_position
    start_y = self.y_position

    # Get the difference between the starting and ending x and y coordinates
    delta_x = (self.x_position - dest_x).abs
    delta_y = (self.y_position - dest_y).abs
    
    if start_y == dest_y || start_x == dest_x || delta_x == delta_y
      true
    else
      false
    end
  end # of valid_move?
end