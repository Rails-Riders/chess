require 'test_helper'

class PawnTest < ActiveSupport::TestCase

	def setup
		@game = Game.create
		@white_pawn = @game.pieces.find_by(:type => "Pawn", :x_position => 1, :y_position => 2, :color => 1)
		@black_pawn = @game.pieces.find_by(:type => "Pawn", :x_position => 1, :y_position => 7, :color => 0)
	end

	test "only first move can move 2 forward" do 
		# Tests for first move 1 & 2 squares and corresponding allowed moves
		exptected_allowed = true

		# If first move is forward one space
		actual = @white_pawn.first_move?(3)
		assert_equal exptected_allowed, actual

		# If first move is forward two spaces
		actual = @white_pawn.first_move?(4)
		assert_equal exptected_allowed, actual

		# If first move is forward one space
		actual = @black_pawn.first_move?(6)
		assert_equal exptected_allowed, actual

		# If first move is forward two spaces
		actual = @black_pawn.first_move?(5)

		# Tests for second moves more than one square
		expected_disallowed = false

		@white_pawn.update(:y_position => 3)
		@black_pawn.update(:y_position => 6)
		# If second move tries to move 2 spaces 
		actual = @white_pawn.first_move?(5)
		assert_equal expected_disallowed, actual
 

		# If second move tries to move 2 
		actual = @black_pawn.first_move?(4)
		assert_equal expected_disallowed, actual  
	end

	test "can only move forward not backwards" do
		pieces_to_remove = @game.pieces.where.not(:type => 'Pawn')
		pieces_to_remove.update_all(:active => 0)

 		@white_pawn.update(:x_position => 5, :y_position => 2)
 		@black_pawn.update(:x_position => 5, :y_position => 7)

		expected = true
		# Move white pawn backwards
		actual = @white_pawn.backwards_move?(1)
		assert_equal expected, actual

		# Move black pawn backwards
		actual = @black_pawn.backwards_move?(8)
		assert_equal expected, actual
	end

	test "cannot capture vertical/vertical obstacle" do 
		pieces_to_remove = @game.pieces.where.not(:type => 'Pawn')
		pieces_to_remove.update_all(:active => 0)

 		@white_pawn.update(:x_position => 5, :y_position => 5)
 		@black_pawn.update(:x_position => 5, :y_position => 6)
 		
 		expected = true
 		# Check for vertical obstacle for white pawn
 		actual = @white_pawn.vertical_obstacle?(6)
 		assert_equal expected, actual

 		# Check for vertical obstacle for black pawn
 		actual = @black_pawn.vertical_obstacle?(5)
 		assert_equal expected, actual
	end

	test "can only capture unfriendly diagonally" do 
		pieces_to_remove = @game.pieces.where.not(:type => 'Pawn')
		pieces_to_remove.update_all(:active => 0)
		
		@white_pawn.update(:x_position => 4, :y_position => 4)
 		@black_pawn.update(:x_position => 5, :y_position => 5)

 		expected = true
 		# Can capture black pawn diagonally
 		actual = @white_pawn.capture_diagonally?(5, 5)

 		assert_equal expected, actual

 		@black_pawn.update(:x_position => 6, :y_position => 6)
 		@white_pawn.update(:x_position => 5, :y_position => 5)

 		# Can capture white pawn diagonally
 		actual = @black_pawn.capture_diagonally?(5, 5)

 		assert_equal expected, actual

 		# Cannot capture a friendly diagonally
 		black_pawn_2 = @game.pieces.find_by(:type => "Pawn", :x_position => 7, :y_position => 7, :color => 0)
 		black_pawn_2.update(:y_position => 5)

 		actual = @black_pawn.capture_diagonally?(7, 5)
 		expected = false

 		assert_equal expected, actual
 	end

 	test "always allowed to move 1 forward if not blocked" do 
 		# Can always move forward 1 if no obstacles
 		pieces_to_remove = @game.pieces.where.not(:type => 'Pawn')
		pieces_to_remove.update_all(:active => 0)

		expected = true 
		actual = @white_pawn.always_allowed(1,3)

		assert_equal expected, actual

		# Cannot move if change in x
		expected = false
		actual = @white_pawn.always_allowed(2,3)

		assert_equal expected, actual
	end

	test "check all methods together within valid_move?" do

		pieces_to_remove = @game.pieces.where.not(:type => 'Pawn')
    pieces_to_remove.update_all(:active => 0)

		# Test first move up 2 but x changes by 1
		expected = false 
		actual = @white_pawn.valid_move?(2,4)

		assert_equal expected, actual

		# Test 1st move 1 forward but met by obstacle
		@black_pawn.update(:y_position => 3)
		actual = @white_pawn.valid_move?(1,3)

		assert_equal expected, actual

		# Test 1st move 1 forward no obstacles
		expected = true
		@black_pawn.update(:active => 0)
		actual = @white_pawn.valid_move?(1,3)

		assert_equal expected, actual

		# Test 1st move 2 forward no obstacles
    actual = @white_pawn.valid_move?(1,4)
    assert_equal expected, actual
	end
end