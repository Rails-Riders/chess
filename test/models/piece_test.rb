require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "detect illegal destination that's not horizontal, vertical, or diagonal" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => Queen)

    expected = "Error: Illegal move"

    actual = white_queen.is_obstructed?(8, 3)

    assert_equal expected, actual
  end

  test "detect when there is NO obstacle horizontally" do
    game = Game.create

    # Arbitrarily move every piece on row 1 to row 3 except for the queen
    pieces_to_move = game.pieces.where('y_position = ? AND type != ?', 1, 'Queen')
    pieces_to_move.update_all(:y_position => 3)

    white_queen = game.pieces.find_by(:y_position => 1, :type => 'Queen')

    expected = false

    # Test 2 squares to the east
    actual = white_queen.is_obstructed?(6, 1)

    assert_equal expected, actual

    # Test a destination far east
    actual = white_queen.is_obstructed?(8, 1)

    assert_equal expected, actual

    # Test 2 squares to the west
    actual = white_queen.is_obstructed?(2, 1)

    assert_equal expected, actual

    # Test a destination far west
    actual = white_queen.is_obstructed?(1, 1)

    assert_equal expected, actual
  end

  test "detect when there IS an obstacle horizontally" do
    game = Game.create

    white_queen = game.pieces.find_by(:y_position => 1, :type => 'Queen')

    expected = true

    # --------------------------------------------------
    # Test 2 squares to the east
    actual = white_queen.is_obstructed?(6, 1)

    assert_equal expected, actual

    # --------------------------------------------------
    # Test a destination far east
    # Move the white king of the way
    white_king = game.pieces.find_by(:color => 1, :type => 'King')
    white_king.update(:y_position => 5)

    actual = white_queen.is_obstructed?(8, 1)

    assert_equal expected, actual

    # --------------------------------------------------
    # Test 2 squares to the west
    actual = white_queen.is_obstructed?(2, 1)

    assert_equal expected, actual

    # --------------------------------------------------
    # Test a destination far west
    # Move the whsquare_white_bishop out of the way
    whsquare_white_bishop = game.pieces.find_by(:color => 1,
                                                :type => 'Bishop',
                                                :x_position => 6)
    whsquare_white_bishop.update(:y_position => 5)

    actual = white_queen.is_obstructed?(1, 1)

    assert_equal expected, actual
  end

  test "detect when there is NO obstacle vertically" do
    game = Game.create

    pieces_to_move = game.pieces.where(:x_position => 4)
    pieces_to_move.update_all(:x_position => 1)

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    white_queen.update(:x_position => 4, :y_position => 5)

    expected = false

    # Test 2 squares to the north
    actual = white_queen.is_obstructed?(4, 7)

    assert_equal expected, actual

    # Test a destination far north
    actual = white_queen.is_obstructed?(4, 8)

    assert_equal expected, actual

    # Test 2 squares to the south
    actual = white_queen.is_obstructed?(4, 3)

    assert_equal expected, actual

    # Test a destination far south
    actual = white_queen.is_obstructed?(4, 1)

    assert_equal expected, actual
  end

  test "detect when there IS obstacle vertically" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    white_queen.update(:x_position => 4, :y_position => 5)

    expected = true

    # Test a destination far north
    actual = white_queen.is_obstructed?(4, 8)

    assert_equal expected, actual

    # Test a destination far south
    actual = white_queen.is_obstructed?(4, 1)

    assert_equal expected, actual
  end

  test "detect when there is NO obstacle northeast & southwest" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    white_queen.update(:y_position => 3)

    expected = false

    # Test 2 squares to the northeast
    actual = white_queen.is_obstructed?(6, 5)

    assert_equal expected, actual

    # Test 3 squares to the northeast
    actual = white_queen.is_obstructed?(7, 6)

    assert_equal expected, actual

    # Update the queen's position so southwest path is clear
    white_queen.update(:y_position => 6)

    # Test 2 squares to the southwest
    actual = white_queen.is_obstructed?(2, 4)

    assert_equal expected, actual

    # Test 3 squares to the southwest
    actual = white_queen.is_obstructed?(1, 3)

    assert_equal expected, actual
  end

  test "detect when there IS obstacle northeast & southwest" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    expected = true

    # Test 2 squares to the northeast
    actual = white_queen.is_obstructed?(6, 3)

    assert_equal expected, actual

    # Test 3 squares to the northeast
    actual = white_queen.is_obstructed?(7, 4)

    assert_equal expected, actual

    # Update the queen's position so southwest path is clear
    white_queen.update(:y_position => 4)

    # Move a pawn to make an obstacle
    blocking_pawn = game.pieces.find_by(:x_position => 3, :y_position => 2)
    blocking_pawn.update(:y_position => 3)

    # Test 2 squares to the southwest
    actual = white_queen.is_obstructed?(2, 2)

    assert_equal expected, actual

    # Test 3 squares to the southwest
    actual = white_queen.is_obstructed?(1, 1)

    assert_equal expected, actual
  end

  test "detect when there is NO obstacle northwest & southwest" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    white_queen.update(:y_position => 3)

    expected = false

    # Test 2 squares to the northeast
    actual = white_queen.is_obstructed?(2, 5)

    assert_equal expected, actual

    # Test 3 squares to the northeast
    actual = white_queen.is_obstructed?(1, 6)

    assert_equal expected, actual

    # Update the queen's position so southeast path is clear
    white_queen.update(:y_position => 6)

    # Test 2 squares to the southwest
    actual = white_queen.is_obstructed?(6, 4)

    assert_equal expected, actual

    # Test 3 squares to the southwest
    actual = white_queen.is_obstructed?(8, 2)

    assert_equal expected, actual
  end

  test "detect when there IS obstacle northwest & southeast" do
    game = Game.create

    white_queen = game.pieces.find_by(:color => 1, :type => 'Queen')

    expected = true

    # Test 2 squares to the northwest
    actual = white_queen.is_obstructed?(2, 3)

    assert_equal expected, actual

    # Test 3 squares to the northwest
    actual = white_queen.is_obstructed?(1, 4)

    assert_equal expected, actual

    # Update the queen's position so southwest path is clear
    white_queen.update(:y_position => 4)

    # Move a pawn to make an obstacle
    blocking_pawn = game.pieces.find_by(:x_position => 5, :y_position => 2)
    blocking_pawn.update(:y_position => 3)

    # Test 2 squares to the southeast
    actual = white_queen.is_obstructed?(6, 2)

    assert_equal expected, actual

    # Test 3 squares to the southeast
    actual = white_queen.is_obstructed?(7, 1)

    assert_equal expected, actual
  end

end