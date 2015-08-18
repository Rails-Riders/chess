require 'test_helper'

class QueenTest < ActiveSupport::TestCase
  test "moves that are valid diagonals" do
    game = Game.create

    # Deactivate all pieces except for queens
    pieces_to_deactivate = game.pieces.where.not(:type => 'Queen')

    pieces_to_deactivate.update_all(:active => 0)

    # Find any queen
    queen = game.pieces.find_by(:type => 'Queen')

    # Update its position so it doesn't run into anything
    queen.update(:x_position => 5, :y_position => 5)

    expected = true
    
    # Test 1 sqare move northeast
    actual = queen.valid_move?(6, 6)

    assert_equal expected, actual

  #   # Test move far northeast
  #   actual = queen.valid_move?(8, 8)

  #   assert_equal expected, actual

  #   # Test 1 sqare move southeast
  #   actual = queen.valid_move?(6, 4)

  #   assert_equal expected, actual

  #   # Test move far southeast
  #   actual = queen.valid_move?(8, 2)

  #   assert_equal expected, actual

  #   # Test 1 sqare move southwest
  #   actual = queen.valid_move?(4, 4)

  #   assert_equal expected, actual

  #   # Test move far southwest
  #   actual = queen.valid_move?(1, 1)

  #   assert_equal expected, actual

  #   # Test 1 sqare move northwest
  #   actual = queen.valid_move?(4, 6)

  #   assert_equal expected, actual

  #   # Test move far northwest
  #   actual = queen.valid_move?(2, 8)

  #   assert_equal expected, actual
  end

  # test "moves that are not diagonals" do
  #   game = Game.create

  #   # Deactivate all pieces except for queens
  #   pieces_to_deactivate = game.pieces.where.not(:type => 'Queen')

  #   pieces_to_deactivate.update_all(:active => 0)

  #   # Find any queen
  #   queen = game.pieces.find_by(:type => 'Queen')
    
  #   expected = false

  #   # Test invalid move east
  #   actual = queen.valid_move?(6, 5)

  #   assert_equal expected, actual

  #   # Test invalid move west
  #   actual = queen.valid_move?(4, 5)

  #   assert_equal expected, actual

  #   # Test invalid move south
  #   actual = queen.valid_move?(5, 4)
 
  #   assert_equal expected, actual

  #   # Test invalid move north
  #   actual = queen.valid_move?(5, 6)

  #   assert_equal expected, actual

  #   #--------------------------------------------------
  #   # Tests for edge cases:

  #   # Test invalid non-move where the params match the piece's current location
  #   actual = queen.valid_move?(5, 5)

  #   assert_equal expected, actual

  #   # Test invalid move northeast ouside the chessboard
  #   actual = queen.valid_move?(9, 9)

  #   assert_equal expected, actual

  #   # Test invalid move southeast ouside the chessboard
  #   actual = queen.valid_move?(9, 1)

  #   assert_equal expected, actual

  #   # Test invalid move soutwest ouside the chessboard
  #   actual = queen.valid_move?(0, 0)

  #   assert_equal expected, actual

  #   # Test invalid move northwest ouside the chessboard
  #   actual = queen.valid_move?(1, 9)

  #   assert_equal expected, actual
  # end

  # test "ensure obstructions are detected" do
  #   game = Game.create

  #   white_queen = game.pieces.find_by(:x_position => 3, :y_position => 1)

  #   expected = false

  #   # Give this queen a destination on a diagonal path obstructed by a pawn
  #   actual = white_queen.valid_move?(5, 3)

  #   assert_equal expected, actual
  # end
end
