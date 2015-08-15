class Bishop < Piece
  def valid_move?(dest_x, dest_y)
    # # Guard against a destination matching a piece's current location
    # return false if [dest_x, dest_y] == [self.x_position, self.y_position]

    # # Guard against a destination that is outside a chessboard's grid
    # return false if dest_x < 1 || dest_x > 8
    # return false if dest_y < 1 || dest_y > 8
    
    # Get the difference between a piece's current x_position and dest_x
    x_delta = (self.x_position - dest_x).abs

    # Get the difference between a piece's current y_position and dest_y
    y_delta = (self.y_position - dest_y).abs

    # # Ensure the params match a king's moveset of 1 square in any direction
    # if x_delta < 2 && y_delta < 2
    #   true
    # else 
    #   false
    # end

    # Ensure it can only move diagonally
    if x_delta == y_delta
      true
    else
      false
    end
  end
end