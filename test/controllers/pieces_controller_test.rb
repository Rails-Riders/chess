require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  def setup
    @game = Game.create(id: 1)
    @piece = Piece.find_by(type: "Pawn", color: 1, x_position: 4, y_position: 2, game_id: @game.id)
  end

  test "should allow update" do
    put :update, {id: @piece.id, x_position: 4, y_position: 3 }

    assert_redirected_to "/games/#{@game.id}"
  end

  test "should not allow update returns flash message" do
    patch :update, {id: @piece.id, x_position: 4, y_position: 5 }

    assert_equal "That move is not allowed!  Please choose your piece and try again.", flash[:alert]
  end

  # Test game turn functionality
  # ------------------------------------------------------------------------
  test "backend should ignore the waiting player's moves" do
    # Assume that 2 players have joined a game and are assigned their colors
    #white_player = FactoryGirl.create(:user, :id => 7)
    #black_player = FactoryGirl.create(:user, :id => 3)

    # game = FactoryGirl.create(:game,
    #                           :id => 10,
    #                           :player_turn => 1,
    #                           :white_player_id => 7,
    #                           :black_player_id => 3)


    # Assume that the functionality of assigning players their respect pieces
    # by color is already built and replicate that
    # white_pieces = game.pieces.where(:color => 1).update_all(:player_id => 7)

    # black_pieces = game.pieces.where(:color => 0).update_all(:player_id => 3)



    # black_pawn = game.pieces.find_by(:x_position => 1, :y_position => 7)
    # puts black_pawn.inspect

    # Make the black player try to make a move outside of his turn
    # put :update, id: black_pawn.id, piece: { x_position: 1, y_position: 6 }



    @game.update(:player_turn => 1)

    white_pieces = @game.pieces.where(:color => 1)
    black_pieces = @game.pieces.where(:color => 0)

    white_pawn = @game.pieces.find_by(:x_position => 1, :y_position => 2, :game_id => @game.id)
    black_pawn = @game.pieces.find_by(:x_position => 1, :y_position => 7, :game_id => @game.id)

    # Make the black player try to make a move outside of his turn
    put :update, { id: black_pawn.id, x_position: 1, y_position: 6 }

    black_pawn.reload

    expected = [1, 7]

    actual = [black_pawn.x_position, black_pawn.y_position]

    assert_equal expected, actual
  end

  test "should update piece to new coordinates" do
    game = Game.create

    white_pawn = game.pieces.find_by(:x_position => 1, :y_position => 2)

    # Make the white pawn move via http request
    put :update, { id: white_pawn.id, x_position: 1, y_position: 3 }

    white_pawn.reload

    expected = [1, 3]

    actual = [white_pawn.x_position, white_pawn.y_position]

    assert_equal expected, actual
  end
end
