require 'test_helper'

class KingTest < ActiveSupport::TestCase
    test "move king left with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_left

    expected = [4, 5]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving left off the chessboard" do
    king = Piece.create(:type => 'King', :x_position => 1, :y_position => 1)

    king.move_left

    expected = [1, 1]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "move king right with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_right

    expected = [6, 5]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving right off the chessboard" do
    king = Piece.create(:type => 'King', :x_position => 8, :y_position => 1)

    king.move_right

    expected = [8, 1]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "move king up with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_up

    expected = [5, 6]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving up off the chessboard" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 8)
 
    king.move_up
 
    expected = [5, 8]
 
    actual = [king.x_position, king.y_position]
 
    assert_equal expected, actual
  end

  test "move king down with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_down

    expected = [5, 4]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving down off the chessboard" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 1)
  
    king.move_down
  
    expected = [5, 1]
  
    actual = [king.x_position, king.y_position]
  
    assert_equal expected, actual
  end

  test "move king North East with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_NE

    expected = [6, 6]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving North East off the chessboard" do
    # Test when a piece is at the chessboard's far right side with room to move up
    king = Piece.create(:type => 'King', :x_position => 8, :y_position => 5)
    
    king.move_NE
 
    expected = [8, 5]
 
    actual = [king.x_position, king.y_position]
 
    assert_equal expected, actual

    # Test when a piece is at the chessboard's top with space to move right
    king.update(:x_position => 5, :y_position => 8)
    
    king.move_NE
    
    expected = [5, 8]
    
    actual = [king.x_position, king.y_position]
    
    assert_equal expected, actual
  end

  test "move king South East with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_SE

    expected = [6, 4]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving South East off the chessboard" do
    # Test when a piece is at the chessboard's far right side with room to move down
    king = Piece.create(:type => 'King', :x_position => 8, :y_position => 5)
    
    king.move_SE
  
    expected = [ 8, 5 ]
  
    actual = [king.x_position, king.y_position]
  
    assert_equal expected, actual

    # Test when a piece is at the chessboard's bottom with space to move right
    king.update(:x_position => 5, :y_position => 1)
    
    king.move_SE
    
    expected = [5, 1]
    
    actual = [king.x_position, king.y_position]
    
    assert_equal expected, actual
  end

  test "move king South West with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_SW

    expected = [4, 4]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving South West off the chessboard" do
    # Test when a piece is at the chessboard's far left side with room to move down
    king = Piece.create(:type => 'King', :x_position => 1, :y_position => 5)
    
    king.move_SW
  
    expected = [1, 5]
  
    actual = [king.x_position, king.y_position]
  
    assert_equal expected, actual

    # Test when a piece is at the chessboard's bottom with space to move left
    king.update(:x_position => 5, :y_position => 1)
    
    king.move_SW
    
    expected = [5, 1]
    
    actual = [king.x_position, king.y_position]
    
    assert_equal expected, actual
  end

  test "move king North West with no obstructions" do
    king = Piece.create(:type => 'King', :x_position => 5, :y_position => 5)

    king.move_NW

    expected = [4, 6]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end

  test "stop king from moving North West off the chessboard" do
    # Test when a piece is at the chessboard's far left side with room to move up
    king = Piece.create(:type => 'King', :x_position => 1, :y_position => 5)

    king.move_NW

    expected = [1, 5]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual

    # Test when a piece is at the chessboard's top with space to move left
    king.update(:x_position => 5, :y_position => 8)

    king.move_NW

    expected = [5, 8]

    actual = [king.x_position, king.y_position]

    assert_equal expected, actual
  end
end
