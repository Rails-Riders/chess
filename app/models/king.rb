class King < Piece
  MIN_POSITION = 1
  MAX_POSITION = 8

  def move_left
    return if self.x_position == MIN_POSITION
    
    self.update(:x_position => (self.x_position - 1))
  end

  def move_right
    return if self.x_position == MAX_POSITION
    
    self.update(:x_position => (self.x_position + 1))
  end

  def move_up
    return if self.y_position == MAX_POSITION
    
    self.update(:y_position => (self.y_position + 1))
  end

  def move_down
    return if self.y_position == MIN_POSITION
    
    self.update(:y_position => (self.y_position - 1))
  end

  def move_NE
    return if self.x_position == MAX_POSITION
    return if self.y_position == MAX_POSITION

    move_right

    move_up
  end

  def move_SE
    return if self.x_position == MAX_POSITION
    return if self.y_position == MIN_POSITION

    move_right
    
    move_down
  end

  def move_SW
    return if self.x_position == MIN_POSITION
    return if self.y_position == MIN_POSITION

    move_left
    
    move_down
  end

  def move_NW
    return if self.x_position == MIN_POSITION
    return if self.y_position == MAX_POSITION

    move_left

    move_up
  end
end