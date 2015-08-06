require 'test_helper'
require 'minitest/autorun'

class PieceTest < MiniTest::Unit::TestCase #ActiveSupport::TestCase

	#Diagonal Tests Left to Right
    def test_is_obstructed_diagonal_left_to_right_valid
      assert Piece.new.is_obstructed?(0, 0, 2, 2)
    end

    def test_is_obstructed_diagonal_left_to_right_invalid
      assert ! Piece.new.is_obstructed?(0, 1, 2, 3) 
    end

    def test_is_obstructed_diagonal_reverse_left_to_right_valid
      assert Piece.new.is_obstructed?(7, 3, 5, 5) 
    end

    def test_is_obstructed_diagonal_reverse_left_to_right_invalid
      assert ! Piece.new.is_obstructed?(7, 0, 5, 2) 
    end
    
    #Diagonal Tests Right to Left
    def test_is_obstructed_diagonal_right_to_left_valid
      assert Piece.new.is_obstructed?(0, 7, 2, 2) 
    end

    def test_is_obstructed_diagonal_right_to_left_invalid
      assert ! Piece.new.is_obstructed?(1, 7, 3, 5) 
    end

    def test_is_obstructed_diagonal_reverse_right_to_left_valid
      assert Piece.new.is_obstructed?(7, 7, 5, 5) 
    end

    def test_is_obstructed_diagonal_reverse_right_to_left_invalid
      assert ! Piece.new.is_obstructed?(6, 6, 4, 4) 
    end

    #Vertical Tests
    def test_is_obstructed_vertical_valid
      assert Piece.new.is_obstructed?(0, 0, 2, 0) 
    end

    def test_is_obstructed_vertical_invalid
      assert ! Piece.new.is_obstructed?(1, 0, 3, 0)
    end

    def test_is_obstructed_vertical_reverse_valid
      assert Piece.new.is_obstructed?(7, 3, 5, 3) 
    end

    def test_is_obstructed_vertical_reverse_invalid
      assert ! Piece.new.is_obstructed?(5, 1, 3, 1)
    end

    #Horizontal Tests
    def test_is_obstructed_horizontal_valid
      assert Piece.new.is_obstructed?(1, 0, 1, 2) 
    end

    def test_is_obstructed_horizontal_invalid
      assert ! Piece.new.is_obstructed?(1, 1, 1, 3)
    end

    def test_is_obstructed_horizontal_reverse_valid
      assert Piece.new.is_obstructed?(1, 2, 1, 0) 
    end

    def test_is_obstructed_horizontal_reverse_invalid
      assert ! Piece.new.is_obstructed?(6, 2, 6, 0)
    end


  
end
