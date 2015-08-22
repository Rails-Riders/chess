require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  test "update method uses move_to! to update a piece's coordinates" do
    game = Game.create

    # Find a pawn
    white_pawn = game.pieces.find_by(:type => 'Pawn', :color => 1)

    # Tell it to move forward 1 square
    white_pawn.update

    # Call update
    #
    # assert
  end
end
