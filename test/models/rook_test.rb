require 'test_helper'

class RookTest < ActiveSupport::TestCase
	test "moves that are valid" do
		game = Game.create
		pieces_to_deactivate = game.pieces.where.not(:type => 'Rook')
		pieces_to_deactivate.update_all(:active => 0)

	    #Find any rook
	    rook = game.pieces.find_by(:type => 'Rook')
		rook.update(:x_position => 3, :y_position => 5)

		expected = true

		#move east
		actual = rook.valid_move?(3, 8)
		assert_equal expected, actual

		#move west
		actual = rook.valid_move?(3, 1)
		assert_equal expected, actual

		#move north
		actual = rook.valid_move?(1, 5)
		assert_equal expected, actual

		#move south
		actual = rook.valid_move?(8, 5)
		assert_equal expected, actual
	end

	test "moves that are invalid" do

		game = Game.create
		pieces_to_deactivate = game.pieces.where.not(:type => 'Rook')
		pieces_to_deactivate.update_all(:active => 0)

		# Find any rook
	    rook = game.pieces.find_by(:type => 'Rook')
		rook.update(:x_position => 3, :y_position => 5)

		
		expected = false

		#move north-east
		actual = rook.valid_move?(1, 7)
		assert_equal expected, actual

		#move north-west
		actual = rook.valid_move?(1, 3)
		assert_equal expected, actual

		#move south-east
		actual = rook.valid_move?(5, 7)
		assert_equal expected, actual

		#move south-west
		actual = rook.valid_move?(5, 3)
		assert_equal expected, actual

		#move off board east
		actual = rook.valid_move?(3, 9)
		assert_equal expected, actual

		#move off board west
		actual = rook.valid_move?(3, 0)
		assert_equal expected, actual

		#move off board south
		actual = rook.valid_move?(9, 5)
		assert_equal expected, actual

		#move off board north
		actual = rook.valid_move?(0, 5)
		assert_equal expected, actual

		#move to current square
		actual = rook.valid_move?(3, 5)
		assert_equal expected, actual


	end

end