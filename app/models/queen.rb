class Queen < Piece
  def valid_move?(x_dest, y_dest)
    # Guard against a destination matching a piece's current location
    return false if [x_dest, y_dest] == [self.x_position, self.y_position]

    # Guard against a destination that is outside a chessboard's grid
    return false if x_dest < 1 || x_dest > 8
    return false if y_dest < 1 || y_dest > 8
    
    # Get the difference between a piece's current x_position and x_dest
    x_delta = (self.x_position - x_dest).abs

    # Get the difference between a piece's current y_position and y_dest
    y_delta = (self.y_position - y_dest).abs

    # Ensure the params match a king's moveset of 1 square in any direction
    if x_delta < 2 && y_delta < 2
      true
    else 
      false
    end
  end
end