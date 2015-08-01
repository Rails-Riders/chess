class Game < ActiveRecord::Base
	belongs_to :user
  has_many :pieces

  after_create :populate_board!

  def populate_board!
    # Store the game's id in a var. Note: .pluck returns an array
    game_id = Game.pluck(:id)

    # These are initialized to the white pieces' y coordinates.
    # Note: y2 is for the pawns' y coordinate.
    y = 1
    y2 = 2

    # Create white pieces locations on 1st loop and then 
    # the black pieces locations on the 2nd loop
    2.times do
      # Create 8 pawns                   
      1.upto(8) do |x|
        Pawn.create( :square_location => [x, y2] )
      end

      # Create 2 rooks 
      1.step(8, 7) do |x|
        Rook.create( :square_location => [x, y] )
      end

      # Create 2 knights
      2.step(7, 5) do |x|
        Knight.create( :square_location => [x, y] )
      end

      # Create 2 bishops
      3.step(6, 3) do |x|
        Bishop.create( :square_location => [x, y] )
      end

      # Create a queen
      Queen.create( :square_location => [4, y] )

      # Create a king
      King.create( :square_location => [5, y] )

      # Update y and y2 values for the black pieces' y coordinates
      y = 8
      y2 = 7
    end  

    # Update pieces with additional attributes
    Piece.update_all( :active  => 1,
                      :game_id => game_id[0] )    
  end
end
