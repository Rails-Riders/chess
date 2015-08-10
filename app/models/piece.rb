class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

  def move_to!(new_x, new_y)
    friendly_color = self.color

    friend_or_foe = game.pieces.find_by(:x_position => new_x,
                                        :y_position => new_y)

    # If no piece exists at the new location, just move to said location
    if friend_or_foe.nil?
      self.update(:x_position => new_x, :y_position => new_y)

    # Else if a friendly piece exists there, do nothing
    elsif friend_or_foe.color == friendly_color
      return
    else
      # It's an enemy. Capture it
      friend_or_foe.update(:active => 0)

      # Move to the enemy's now vacant position
      self.update(:x_position => new_x, :y_position => new_y)
    end          
  end
end
