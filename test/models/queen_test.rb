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

    # Test move far northeast
    actual = queen.valid_move?(8, 8)

    assert_equal expected, actual

    # Test 1 sqare move southeast
    actual = queen.valid_move?(6, 4)

    assert_equal expected, actual

    # Test move far southeast
    actual = queen.valid_move?(8, 2)

    assert_equal expected, actual

    # Test 1 sqare move southwest
    actual = queen.valid_move?(4, 4)

    assert_equal expected, actual

    # Test move far southwest
    actual = queen.valid_move?(1, 1)

    assert_equal expected, actual

    # Test 1 sqare move northwest
    actual = queen.valid_move?(4, 6)

    assert_equal expected, actual

    # Test move far northwest
    actual = queen.valid_move?(2, 8)

    assert_equal expected, actual
  end

  test "moves that are valid on a horitonzal or vertical path" do
    game = Game.create

    # Deactivate all pieces except for queens
    pieces_to_deactivate = game.pieces.where.not(:type => 'Queen')

    pieces_to_deactivate.update_all(:active => 0)

    # Find any queen
    queen = game.pieces.find_by(:type => 'Queen')
    
    # Update its position so it doesn't run into anything
    queen.update(:x_position => 5, :y_position => 5)

    expected = true

    # Test 1 sqare move east
    actual = queen.valid_move?(6, 5)

    assert_equal expected, actual

    # Test move far east
    actual = queen.valid_move?(8, 5)

    assert_equal expected, actual

    # Test 1 sqare move west
    actual = queen.valid_move?(4, 5)

    assert_equal expected, actual

    # Test move far west
    actual = queen.valid_move?(1, 5)

    assert_equal expected, actual

    # Test 1 sqare move south
    actual = queen.valid_move?(5, 4)
 
    assert_equal expected, actual

    # Test move far south
    actual = queen.valid_move?(5, 1)

    assert_equal expected, actual

    # Test 1 sqare move north
    actual = queen.valid_move?(5, 6)

    assert_equal expected, actual

    # Test move far north
    actual = queen.valid_move?(5, 8)

    assert_equal expected, actual
  end

  test "moves that are invalid" do
    game = Game.create

    # Deactivate all pieces except for queens
    pieces_to_deactivate = game.pieces.where.not(:type => 'Queen')

    pieces_to_deactivate.update_all(:active => 0)

    # Find any queen
    queen = game.pieces.find_by(:type => 'Queen')
    
    # Update its position so it doesn't run into anything
    queen.update(:x_position => 5, :y_position => 5)

    expected = false

    # Test an invalid move
    actual = queen.valid_move?(4, 3)

    assert_equal expected, actual

    # Test another invalid move
    actual = queen.valid_move?(2, 7)

    assert_equal expected, actual
  end

  test "ensure obstructions are detected" do
    game = Game.create

    white_queen = game.pieces.find_by(:x_position => 4, :y_position => 1)

    expected = false

    # Give this queen a destination obstructed by a pawn
    actual = white_queen.valid_move?(4, 3)

    assert_equal expected, actual
  end
end
