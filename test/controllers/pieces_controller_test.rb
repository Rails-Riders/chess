require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  test "update method uses move_to! to update a piece's coordinates" do
    game = Game.create

    # Find a white piece (I arbitrarily chose the leftmost white pawn)
    white_pawn = game.pieces.find_by(:type => 'Pawn',
                                     :x_position => 1,
                                     :y_position => 2)

    # Find an enemy
    enemy = game.pieces.find_by(:color => 0)

    # Find a ally (I arbitrarily chose a white knight)
    ally = game.pieces.find_by(:type => 'Knight', :color => 1)

    # --------------------------------------------------
    # Simulate a player giving that pawn a valid 1 square move to a blank square
    put :update, :id => white_pawn.id, :x_position => 1, :y_position => 3

    white_pawn.reload

    expected = [1, 3]

    actual = [white_pawn.x_position, white_pawn.y_position]

    assert_equal expected, actual

    # --------------------------------------------------
    # Now the player moves the pawn to a square occupied by a ally:
    ally.update(:x_position => 1, :y_position => 4)

    put :update, :id => white_pawn.id, :x_position => 1, :y_position => 4

    white_pawn.reload
    ally.reload

    expected = [1, 3, 1]

    actual = [white_pawn.x_position, white_pawn.y_position, ally.active]

    assert_equal expected, actual

    # --------------------------------------------------
    # Player decides to move the pawn to a square occupied by an enemy:
    enemy.update(:x_position => 2, :y_position => 4)

    put :update, :id => white_pawn.id, :x_position => 2, :y_position => 4

    white_pawn.reload
    enemy.reload

    expected = [2, 4, 0]

    actual = [white_pawn.x_position, white_pawn.y_position, enemy.active]

    assert_equal expected, actual
  end
end
