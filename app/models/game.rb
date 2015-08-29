require 'pry'
class Game < ActiveRecord::Base
  belongs_to :user
  has_many :pieces

  #before_action only: :show do
   # :in_check(:color)
  #end
  after_create :populate_board!
  after_create :default_turn


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
    checking_piece?(color)
  end

  def checking_piece?(color, piece_id, col, row)
    opponents_pieces = pieces.where.not(color: color, active: 0)
    check_king(color, piece_id, col, row)
    opponents_pieces.each do |piece|
      piece.valid_move?(*@king_position) ? (return true) : false
    end
    return false
  end

  def check_king(color, piece_id, col, row)
    @king = pieces.find_by(type: 'King', color: color)
    piece_moving = pieces.find_by(id: piece_id)
    piece_moving == @king ? (@king_position = col, row) : (@king_position = @king.x_position, @king.y_position)
  end

  def default_turn
    update_attributes(player_turn: 1)
  end
end
