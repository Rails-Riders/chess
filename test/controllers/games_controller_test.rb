require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "show board for selected game == 1" do 
      @game = Game.create(id: 1)
      @selected_piece = Piece.where(type: "Queen", color: "1")
      @pieces = @game.pieces
      
      redirect_to :show {controller: :games, id: id}

      expected = Game.find(params[:id])

      assert_template_layout(expected)
  end
end
