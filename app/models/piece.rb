class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :types

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

  # Change player turn
  def change_player_turn(color)
    if color == 1
      update_attributes(player_turn: 0)
    else
      update_attributes(player_turn: 1)
    end
  end

   # This checks the database for a potential obstacle on a single location
  def obstacle?(check_x, check_y)
    game.pieces.exists?(:x_position => check_x,
                        :y_position => check_y,
                        :active => 1)
  end

  def is_obstructed?(dest_x, dest_y)
    # Get the piece's starting coordinates
    start_x = self.x_position
    start_y = self.y_position

    # Get the difference between the starting and ending x and y coordinates
    delta_x = (start_x - dest_x).abs
    delta_y = (start_y - dest_y).abs

    # Prep x and y incrementors
    increment_x, increment_y = 0

    # Make increment_x go east (1) or west (-1)
    if start_x < dest_x
      increment_x = 1
    else
      increment_x = -1
    end

    # Make increment_y go north (1) or south (-1)
    if start_y < dest_y
      increment_y = 1
    else
      increment_y = -1
    end

    #--------------------------------------------------
    # Find any obstacles when the destination is on a:
    # - horizontal path
    if start_y == dest_y
      check_x = start_x + increment_x

      while check_x - dest_x != 0 do
        return true if obstacle?(check_x, dest_y)

        check_x += increment_x
      end

    return false
    #--------------------------------------------------
    # - vertical path
    elsif start_x == dest_x
      check_y = start_y + increment_y

      while check_y - dest_y != 0 do
        return true if obstacle?(dest_x, check_y)

        check_y += increment_y
      end

      return false
    #--------------------------------------------------
    # - diagonal path
    else
      return "Error: Illegal move" if delta_x != delta_y

      check_x = start_x + increment_x
      check_y = start_y + increment_y

      while (check_x - dest_x != 0) && (check_y - dest_y != 0) do
        return true if obstacle?(check_x, check_y)

        check_x += increment_x
        check_y += increment_y
      end

      return false
    end
  end # of is_obstructed?

  def move_to!(new_x, new_y)
    friendly_color = self.color

    friend_or_foe = game.pieces.find_by(:x_position => new_x,
                                        :y_position => new_y)

    # If no piece exists at the new location, just move to said location
    if friend_or_foe.nil?
      self.update(:x_position => new_x, :y_position => new_y)

    # Else if a friendly piece exists there, do nothing
    #elsif friend_or_foe.color == friendly_color
      #return
    else
      # It's an enemy. Capture it
      friend_or_foe.update(:active => 0)

      # Move to the enemy's now vacant position
      self.update(:x_position => new_x, :y_position => new_y)
    end
  end

  def friendly_piece?(new_x, new_y)
    obstacle_piece = game.pieces.find_by(
      :x_position => new_x, :y_position => new_y, :active => 1)
    if obstacle_piece.nil?
      return false
    else
      obstacle_piece.color == color
    end
  end

  def off_the_board?(new_x, new_y)
    [new_x > 8, new_x < 1, new_y > 8, new_y < 1].any?
  end

  def going_nowhere?(new_x, new_y)
    new_x == x_position && new_y == y_position
  end

  def nil_move?(new_x, new_y)
    [off_the_board?(new_x, new_y), friendly_piece?(new_x, new_y), going_nowhere?(new_x, new_y)].any?
  end
end # end class
