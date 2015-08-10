require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  test "move to a new, unoccupied destination" do
    # Assume that is_obstructed? and is_valid? give the green light
    
    game = Game.create
    
    # Find the white king
    white_king = game.pieces.find_by(["color = ? AND type = ?", 1, 'King'])
    
    # Then arbitrarily put it near middle of chessboard
    white_king.update(:x_position => 5, :y_position => 5) 

    # Test when a new destination is unoccupied
    white_king.move_to!(6, 5)

    expected = [6, 5]

    actual = [white_king.x_position, white_king.y_position]

    assert_equal expected, actual
  end

  test "move to a new destination that's occupied by a friendly" do
    # Assume that is_obstructed? and is_valid? give the green light
    
    game = Game.create
    
    # Find the white king
    white_king = game.pieces.find_by(:color => 1, :type => 'King')

    # Test when a new destination is occupied by a friendly
    white_king.move_to!(5, 2)

    expected = [5, 1]

    actual = [white_king.x_position, white_king.y_position]

    assert_equal expected, actual
  end

  test "move to a new destination that's occupied by an enemy" do        
    game = Game.create
    
    # Find the white king and black king
    white_king = game.pieces.find_by(:color => 1, :type => 'King')
    black_king = game.pieces.find_by(:color => 0, :type => 'King')

    # Then arbitrarily put then near each other for an attack scenario
    white_king.update(:x_position => 5, :y_position => 5)
    black_king.update(:x_position => 4, :y_position => 4) 

    # Make the white piece attack the black piece assuming that is_obstructed?
    # and is_valid? give the green light
    white_king.move_to!(4, 4)

    expected = [4, 4]

    actual = [white_king.x_position, white_king.y_position]

    # Assert the white piece's new position
    assert_equal expected, actual

    # Refresh the black piece's new state from the database
    black_king.reload

    expected = 0

    actual = black_king.active

    # Assert the black piece's new :active status as captured (or 0)
    assert_equal expected, actual
  end
end
