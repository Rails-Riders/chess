require 'test_helper'

class KingTest < ActiveSupport::TestCase
  test "moves that are valid" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    # Assume is_obstructed? == false (this means there are no obstructions)
    expected = true
    
    # Test a valid move east
    actual = king.valid_move?(6, 5)

    assert_equal expected, actual

    # Test a valid move west
    actual = king.valid_move?(4, 5)

    assert_equal expected, actual

    # Test a valid move south
    actual = king.valid_move?(5, 4)

    assert_equal expected, actual

    # Test a valid move north
    actual = king.valid_move?(5, 6)

    assert_equal expected, actual

    # Test a valid move northeast
    actual = king.valid_move?(6, 6)

    assert_equal expected, actual

    # Test a valid move southeast
    actual = king.valid_move?(6, 4)

    assert_equal expected, actual

    # Test a valid move southwest
    actual = king.valid_move?(4, 4)

    assert_equal expected, actual

    # Test a valid move northwest
    actual = king.valid_move?(4, 6)

    assert_equal expected, actual
  end

  test "moves that are invalid" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    # Assume is_obstructed? == false (this means there are no obstructions)
    
    expected = false

    # Test invalid move east
    actual = king.valid_move?(7, 5)

    assert_equal expected, actual

    # Test invalid move west
    actual = king.valid_move?(3, 5)

    assert_equal expected, actual

    # Test invalid move south
    actual = king.valid_move?(5, 3)
 
    assert_equal expected, actual

    # Test invalid move north
    actual = king.valid_move?(5, 7)

    assert_equal expected, actual

    # Test invalid move northeast
    actual = king.valid_move?(7, 7)

    assert_equal expected, actual

    # Test invalid move southeast
    actual = king.valid_move?(7, 3)

    assert_equal expected, actual

    # Test invalid move southwest
    actual = king.valid_move?(3, 3)

    assert_equal expected, actual

    # Test invalid move northwest
    actual = king.valid_move?(3, 7)

    assert_equal expected, actual

    #--------------------------------------------------
    # Tests for edge cases:

    # Test invalid non-move where the params match the piece's current location
    actual = king.valid_move?(5, 5)

    assert_equal expected, actual

    # Test invalid move east ouside the chessboard
    king.update(:x_position => 8, :y_position => 5)

    actual = king.valid_move?(9, 5)

    assert_equal expected, actual

    # Test invalid move south ouside the chessboard
    king.update(:x_position => 5, :y_position => 1)

    actual = king.valid_move?(5, 0)

    assert_equal expected, actual

    # Test invalid move west ouside the chessboard
    king.update(:x_position => 1, :y_position => 5)

    actual = king.valid_move?(0, 5)

    assert_equal expected, actual

    # Test invalid move north ouside the chessboard
    king.update(:x_position => 5, :y_position => 8)

    actual = king.valid_move?(5, 9)

    assert_equal expected, actual

    # Test invalid move northeast ouside the chessboard
    king.update(:x_position => 8, :y_position => 8)

    actual = king.valid_move?(9, 9)

    assert_equal expected, actual

    # Test invalid move southeast ouside the chessboard
    king.update(:x_position => 8, :y_position => 1)

    actual = king.valid_move?(9, 0)

    assert_equal expected, actual

    # Test invalid move southwest ouside the chessboard
    king.update(:x_position => 1, :y_position => 1)

    actual = king.valid_move?(0, 0)

    assert_equal expected, actual

    # Test invalid move northeast ouside the chessboard
    king.update(:x_position => 1, :y_position => 8)

    actual = king.valid_move?(0, 9)

    assert_equal expected, actual
  end
end
