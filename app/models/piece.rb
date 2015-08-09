class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

  def self.types
    %w(Pawn Rook Knight Bishop Queen King)
  end

  def move_to!(new_x, new_y)
    game.pieces.find_by(:x_position => new_x,         
                        :y_position => new_y,         
                        :player_id  => 0,
                        :active     => 1)                 

    if true
      #something
    end

    self.update(:x_position => new_x, :y_position => new_y)
  end
end
