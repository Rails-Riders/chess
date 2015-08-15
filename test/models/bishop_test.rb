require 'test_helper'

class BishopTest < ActiveSupport::TestCase
  test "moves that are valid" do
    bishop = Piece.create(:type => 'Bishop', :x_position => 5, :y_position => 5)

    # Assume is_obstructed? == false (this means there are no obstructions)
    expected = true
    
    # Test 1 sqare move northeast
    actual = bishop.valid_move?(6, 6)

    assert_equal expected, actual

    # Test a valid move southeast
    actual = bishop.valid_move?(6, 4)

    assert_equal expected, actual

    # Test a valid move southwest
    actual = bishop.valid_move?(4, 4)

    assert_equal expected, actual

    # Test a valid move northwest
    actual = bishop.valid_move?(4, 6)

    assert_equal expected, actual
  end

  # test "moves that are invalid" do
  #   bishop = Piece.create(:type => 'Bishop', :x_position => 5, :y_position => 5)

  #   # Assume is_obstructed? == false (this means there are no obstructions)
    
  #   expected = false

  #   # Test invalid move east
  #   actual = bishop.valid_move?(7, 5)

  #   assert_equal expected, actual

  #   # Test invalid move west
  #   actual = bishop.valid_move?(3, 5)

  #   assert_equal expected, actual

  #   # Test invalid move south
  #   actual = bishop.valid_move?(5, 3)
 
  #   assert_equal expected, actual

  #   # Test invalid move north
  #   actual = bishop.valid_move?(5, 7)

  #   assert_equal expected, actual

  #   # Test invalid move northeast
  #   actual = bishop.valid_move?(7, 7)

  #   assert_equal expected, actual

  #   # Test invalid move southeast
  #   actual = bishop.valid_move?(7, 3)

  #   assert_equal expected, actual

  #   # Test invalid move southwest
  #   actual = bishop.valid_move?(3, 3)

  #   assert_equal expected, actual

  #   # Test invalid move northwest
  #   actual = bishop.valid_move?(3, 7)

  #   assert_equal expected, actual

  #   #--------------------------------------------------
  #   # Tests for edge cases:

  #   # Test invalid non-move where the params match the piece's current location
  #   actual = bishop.valid_move?(5, 5)

  #   assert_equal expected, actual

  #   # Test invalid move east ouside the chessboard
  #   bishop.update(:x_position => 8, :y_position => 5)

  #   actual = bishop.valid_move?(9, 5)

  #   assert_equal expected, actual

  #   # Test invalid move south ouside the chessboard
  #   bishop.update(:x_position => 5, :y_position => 1)

  #   actual = bishop.valid_move?(5, 0)

  #   assert_equal expected, actual

  #   # Test invalid move west ouside the chessboard
  #   bishop.update(:x_position => 1, :y_position => 5)

  #   actual = bishop.valid_move?(0, 5)

  #   assert_equal expected, actual

  #   # Test invalid move north ouside the chessboard
  #   bishop.update(:x_position => 5, :y_position => 8)

  #   actual = bishop.valid_move?(5, 9)

  #   assert_equal expected, actual

  #   # Test invalid move northeast ouside the chessboard
  #   bishop.update(:x_position => 8, :y_position => 8)

  #   actual = bishop.valid_move?(9, 9)

  #   assert_equal expected, actual

  #   # Test invalid move southeast ouside the chessboard
  #   bishop.update(:x_position => 8, :y_position => 1)

  #   actual = bishop.valid_move?(9, 0)

  #   assert_equal expected, actual

  #   # Test invalid move southwest ouside the chessboard
  #   bishop.update(:x_position => 1, :y_position => 1)

  #   actual = bishop.valid_move?(0, 0)

  #   assert_equal expected, actual

  #   # Test invalid move northeast ouside the chessboard
  #   bishop.update(:x_position => 1, :y_position => 8)

  #   actual = bishop.valid_move?(0, 9)

  #   assert_equal expected, actual
  # end
end
