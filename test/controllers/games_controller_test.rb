require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "show page for game == 1" do
    @game = Game.create(id: 1)
    @selected_piece = Piece.where(type: "Queen", color: "1")
    @pieces = @game.pieces

    assert_generates "games/1", {:controller => 'games', :action => 'show', :id => @game.id}
  end

  test "backend should ignore the waiting player's moves" do
    # Assume that 2 players have joined a game and are assigned their colors
    white_player = FactoryGirl.create(:user, :id => 7)
    black_player = FactoryGirl.create(:user, :id => 3)

    game = FactoryGirl.create(:game,
                              :id => 10,
                              :player_turn => 1,
                              :white_player_id => 7,
                              :black_player_id => 3)

    # Assume that the functionality of assigning players their respect pieces
    # by color is already built and replicate that
    white_pieces = game.pieces.where(:color => 1).update_all(:player_id => 7)

    black_pieces = game.pieces.where(:color => 0).update_all(:player_id => 3)



    black_pawn = game.pieces.find_by(:x_position => 1, :y_position => 7)
    puts black_pawn.inspect

    # Make the black player try to make a move outside of his turn
    # put :update, id: black_pawn.id, piece: { x_position: 1, y_position: 6 }



    assert true
  end
end
