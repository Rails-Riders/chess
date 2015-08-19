require 'test_helper'

class KnightTest < ActiveSupport::TestCase

    test "valid first white knight move" do
<<<<<<< HEAD
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 1)
=======
        knight = Piece.create(:type => 'Knight', :x_position => 8, :y_position => 2)
>>>>>>> master
        
        expected = true


        #tests white moves from starting postion
<<<<<<< HEAD
        actual = knight.valid_move?(3, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(1, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(4, 2)
=======
        actual = knight.valid_move?(6, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(6, 1)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(7, 4)
>>>>>>> master
        assert_equal expected, actual
    end



    test "valid second white knight move" do
<<<<<<< HEAD
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 1)
=======
        knight = Piece.create(:type => 'Knight', :x_position => 8, :y_position => 7)
>>>>>>> master
        
        expected = true


        #tests white moves from starting postion
<<<<<<< HEAD
        actual = knight.valid_move?(6, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(8, 3)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(5, 2)
=======
        actual = knight.valid_move?(6, 8)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(6, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(7, 5)
>>>>>>> master
        assert_equal expected, actual
    end


   
    test "valid first black knight move" do
<<<<<<< HEAD
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 8)
=======
        knight = Piece.create(:type => 'Knight', :x_position => 1, :y_position => 7)
>>>>>>> master
        
        expected = true


<<<<<<< HEAD
        #tests black moves from starting postion
        actual = knight.valid_move?(6, 6)
        assert_equal expected, actual

        #tests black moves from starting postion
        actual = knight.valid_move?(8, 6)
        assert_equal expected, actual

        #tests black moves from starting postion
        actual = knight.valid_move?(5, 7)
=======
        #tests white moves from starting postion
        actual = knight.valid_move?(3, 6)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(3, 8)
        assert_equal expected, actual

        #tests white moves from starting postion
        actual = knight.valid_move?(2, 5)
>>>>>>> master
        assert_equal expected, actual
    end



    test "valid second black knight move" do
<<<<<<< HEAD
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 8)
=======
        knight = Piece.create(:type => 'Knight', :x_position => 1, :y_position => 2)
>>>>>>> master
        
        expected = true


<<<<<<< HEAD
        #tests black moves from starting postion
        actual = knight.valid_move?(3, 6)
        assert_equal expected, actual

        #tests black moves from starting postion
        actual = knight.valid_move?(1, 6)
        assert_equal expected, actual

        #tests black moves from starting postion
        actual = knight.valid_move?(4, 7)
        assert_equal expected, actual
    end




        # ----------------------------invalid moves---------------------------------


    test "invalid first white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 1)

        expected = false

        #tests white invalid moves from starting postion
        actual = knight.valid_move?(6, 2)
        assert_equal expected, actual

        #tests white invalid moves from starting postion
        actual = knight.valid_move?(6, 4)
        assert_equal expected, actual

        #tests white invalid moves from starting postion
        actual = knight.valid_move?(1, 6)
        assert_equal expected, actual
    end


    test "invalid second white knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 1)
        
        expected = false


        #tests white invalid moves from starting postion
        actual = knight.valid_move?(5, 5)
        assert_equal expected, actual

        #tests white invalid moves from starting postion
        actual = knight.valid_move?(1, 6)
        assert_equal expected, actual

        #tests white invalid moves from starting postion
        actual = knight.valid_move?(2, 3)
        assert_equal expected, actual
    end

    test "invalid first black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 7, :y_position => 8)
        
        expected = false


        #tests black invalid moves from starting postion
        actual = knight.valid_move?(4, 6)
        assert_equal expected, actual

        #tests black invalid moves from starting postion
        actual = knight.valid_move?(7, 6)
        assert_equal expected, actual

        #tests black invalid moves from starting postion
        actual = knight.valid_move?(6, 7)
        assert_equal expected, actual
    end



    test "invalid second black knight move" do
        knight = Piece.create(:type => 'Knight', :x_position => 2, :y_position => 8)
        
        expected = false


        #tests black invalid moves from starting postion
        actual = knight.valid_move?(2, 6)
        assert_equal expected, actual

        #tests black invalid moves from starting postion
        actual = knight.valid_move?(5, 6)
        assert_equal expected, actual

        #tests black invalid moves from starting postion
        actual = knight.valid_move?(6, 7)
        assert_equal expected, actual
    end



=======
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
>>>>>>> master
end