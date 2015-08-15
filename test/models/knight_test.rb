require 'test_helper'

class KnightTest < ActiveSupport::TestCase

    test "valid first white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 8, :y_position => 2)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(6, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(6, 1)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(7, 4)
        assert_equal expected, actual
    end



    test "valid second white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 8, :y_position => 7)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(6, 8)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(6, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(7, 5)
        assert_equal expected, actual
    end


   
    test "valid first black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 1, :y_position => 7)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(3, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(3, 8)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(2, 5)
        assert_equal expected, actual
    end



    test "valid second black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 1, :y_position => 2)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(3, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(3, 1)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(2, 4)
        assert_equal expected, actual
    end
end