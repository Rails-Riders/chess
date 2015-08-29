class Game < ActiveRecord::Base
  belongs_to :user
  has_many :pieces
  
  after_create :populate_board!

  def populate_board!
    # These are initialized to the white pieces' y coordinates. y2 is for the
    # pawns' y coordinate.
    y = 1
    y2 = 2
    color = 1

    # Create white pieces locations on 1st loop and then 
    # the black pieces locations on the 2nd loop
    2.times do
      # Create 8 pawns                   
      1.upto(8) do |x|
        Pawn.create( :x_position => x,
                     :y_position => y2,
                     :active     => 1,
                     :game_id    => self.id,
                     :color      => color )
      end

      # Create 2 rooks 
      1.step(8, 7) do |x|
        Rook.create( :x_position => x,
                     :y_position => y,
                     :active     => 1,
                     :game_id    => self.id,
                     :color      => color )
      end

      # Create 2 knights
      2.step(7, 5) do |x|
        Knight.create( :x_position => x,
                       :y_position => y,
                       :active     => 1,
                       :game_id    => self.id,
                       :color      => color )
      end

      # Create 2 bishops
      3.step(6, 3) do |x|
        Bishop.create( :x_position => x,
                       :y_position => y,
                       :active     => 1,
                       :game_id    => self.id,
                       :color      => color )
      end

      # Create a queen
      Queen.create( :x_position => 4,
                    :y_position => y,
                    :active     => 1,
                    :game_id    => self.id,
                    :color      => color )

      # Create a king
      King.create( :x_position => 5,
                   :y_position => y,
                   :active     => 1,
                   :game_id    => self.id,
                   :color      => color )

      # Update y, y2, and color values for the black pieces' attributes
      y = 8
      y2 = 7
      color = 0
    end  

  end

  def in_check?(color)
    king = pieces.find_by(type: 'king', color: color)
    opponents_pieces = pieces(!color)

    opponents_pieces.each do |piece|
      if piece.valid_move?(king.x_position, king.y_position)
        @checking_piece = piece
        return true
      else
        return false
      end
    end
  end
  
end
