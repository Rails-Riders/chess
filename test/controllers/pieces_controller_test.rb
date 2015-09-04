require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  def setup
    @game = Game.create(id: 1)
    @piece = Piece.find_by(type: "Pawn", color: 1, x_position: 4, y_position: 2, game_id: @game.id)
  end

  test "should allow update" do
    put :update, id: @piece.id, piece: { x_position: 4, y_position: 3 }
    
    assert_redirected_to "/games/#{@game.id}"
  end

  test "should not allow update returns flash message" do
    patch :update, id: @piece.id, piece: { x_position: 4, y_position: 5 }

    assert_equal "That move is not allowed!  Please choose your piece and try again.", flash[:alert]
  end

end
