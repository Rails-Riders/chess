require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "show page for game == 1" do 
      @game = Game.create(id: 1)
      @selected_piece = Piece.where(type: "Queen", color: "1")
      @pieces = @game.pieces
      
      assert_generates "games/1", {:controller => 'games', :action => 'show', :id => @game.id}
  end
end