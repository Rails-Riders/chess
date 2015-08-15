require 'test_helper'

class KnightTest < ActiveSupport::TestCase

    test "valid first white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 1)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(3, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(1, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(4, 2)
        assert_equal expected, actual
    end



    test "valid second white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 1)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(6, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(8, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(5, 2)
        assert_equal expected, actual
    end


   
    test "valid first black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 8)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(6, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(8, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(5, 7)
        assert_equal expected, actual
    end



    test "valid second black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 8)
        
        expected = true


        #tests white moves from starting postion
        actual = knight.valid_move?(3, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(1, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(4, 7)
        assert_equal expected, actual
    end
end