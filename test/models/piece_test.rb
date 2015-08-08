require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  test "move to a new, unoccupied destination" do
    # Assume that is_obstructed? and is_valid? give the green light
    
    # :player_id (1 == white piece while 0 == black piece) is being used here to
    # indicate enemy and friendly pieces, but this might be changed later. 
    white_king = Piece.create(:player_id => 1, :type => 'King', 
                              :x_position => 5, :y_position => 5)

    # Test when a new destination is unoccupied
    white_king.move_to!(6, 6)

    expected = [6, 6]

    actual = [white_king.x_position, white_king.y_position]

    assert_equal expected, actual
  end

  test "move to a new destination occupied with an enemy" do
    # Assume that is_obstructed? and is_valid? give the green light
    
    # :player_id (1 == white piece while 0 == black piece) is being used here to
    # indicate enemy and friendly pieces, but this might be changed later. 
    white_king = Piece.create(:player_id => 1, :type => 'King', :active => 1,
                              :x_position => 5, :y_position => 5)

    black_pawn = Piece.create(:player_id => 0, :type => 'Pawn', :active => 1,
                              :x_position => 5, :y_position => 6)

    # Test when a new destination is unoccupied
    white_king.move_to!(5, 6)

    expected = [5, 6, 0]

    actual = [white_king.x_position, white_king.y_position, black_pawn.active]

    assert_equal expected, actual
  end
end
