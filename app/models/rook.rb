class Rook < Piece

  def valid_move?(dest_x, dest_y)
    #a move can not be a non-move
    return false if dest_x == self.x_position && dest_y == self.y_position

    #no obstructions allowed
    return false if is_obstructed?(dest_x, dest_y) == true

    #only vertical or horizontal moves allowed
    return false if (dest_x < self.x_position || dest_x > self.x_position) && (dest_y < self.y_position || dest_y > self.y_position)

    return true
  end

end
