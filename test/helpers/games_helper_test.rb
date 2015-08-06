require 'test_helper'

class GamesHelperTest < ActionView::TestCase
	test "piece_color = black" do 
		game = Game.create
		piece = game.pieces.last
		expected = "Black\n" + piece.type  

		assert_equal expected, piece_color(piece)
	end 

	test "piece_color = white" do 
		game = Game.create
		piece = game.pieces.first
		expected = "White\n" + piece.type

		assert_equal "White Pawn", piece_color(piece)
	end

end
