require 'test_helper'

class BishopTest < ActiveSupport::TestCase
  test "moves that are valid diagonals" do
    game = Game.create

    # Deactivate all pieces except for bishops
    pieces_to_deactivate = game.pieces.where.not(:type => 'Bishop')

    pieces_to_deactivate.update_all(:active => 0)

    # Find any bishop
    bishop = game.pieces.find_by(:type => 'Bishop')

    # Update its position so it doesn't run into anything
    bishop.update(:x_position => 5, :y_position => 5)

    expected = true
    
    # Test 1 sqare move northeast
    actual = bishop.valid_move?(6, 6)

    assert_equal expected, actual

    # Test move far northeast
    actual = bishop.valid_move?(8, 8)

    assert_equal expected, actual

    # Test 1 sqare move southeast
    actual = bishop.valid_move?(6, 4)

    assert_equal expected, actual

    # Test move far southeast
    actual = bishop.valid_move?(8, 2)

    assert_equal expected, actual

    # Test 1 sqare move southwest
    actual = bishop.valid_move?(4, 4)

    assert_equal expected, actual

    # Test move far southwest
    actual = bishop.valid_move?(1, 1)

    assert_equal expected, actual

    # Test 1 sqare move northwest
    actual = bishop.valid_move?(4, 6)

    assert_equal expected, actual

    # Test move far northwest
    actual = bishop.valid_move?(2, 8)

    assert_equal expected, actual
  end

  test "moves that are not diagonals" do
    game = Game.create

    # Deactivate all pieces except for bishops
    pieces_to_deactivate = game.pieces.where.not(:type => 'Bishop')

    pieces_to_deactivate.update_all(:active => 0)

    # Find any bishop
    bishop = game.pieces.find_by(:type => 'Bishop')
    
    expected = false

    # Test invalid move east
    actual = bishop.valid_move?(6, 5)

    assert_equal expected, actual

    # Test invalid move west
    actual = bishop.valid_move?(4, 5)

    assert_equal expected, actual

    # Test invalid move south
    actual = bishop.valid_move?(5, 4)
 
    assert_equal expected, actual

    # Test invalid move north
    actual = bishop.valid_move?(5, 6)

    assert_equal expected, actual

    #--------------------------------------------------
    # Tests for edge cases:

    # Test invalid non-move where the params match the piece's current location
    actual = bishop.valid_move?(5, 5)

    assert_equal expected, actual

    # Test invalid move northeast ouside the chessboard
    actual = bishop.valid_move?(9, 9)

    assert_equal expected, actual

    # Test invalid move southeast ouside the chessboard
    actual = bishop.valid_move?(9, 1)

    assert_equal expected, actual

    # Test invalid move soutwest ouside the chessboard
    actual = bishop.valid_move?(0, 0)

    assert_equal expected, actual

    # Test invalid move northwest ouside the chessboard
    actual = bishop.valid_move?(1, 9)

    assert_equal expected, actual
  end

  test "ensure obstructions are detected" do
    game = Game.create

    bk_sq_white_bishop = game.pieces.find_by(:x_position => 3, :y_position => 1)

    expected = false

    # Give this bishop a destination on a diagonal path obstructed by a pawn
    actual = bk_sq_white_bishop.valid_move?(5, 3)

    assert_equal expected, actual
  end
end
