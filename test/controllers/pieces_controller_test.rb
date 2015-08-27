require 'test_helper'
require 'pry'

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

    actual = [white_pawn.x_position, white_pawn.y_position, white_pawn.active]

    assert_equal expected, actual

    expected = [1, 4, 1]

    actual = [ally.x_position, ally.y_position, ally.active]

    assert_equal expected, actual

    # --------------------------------------------------
    # Player decides to move the pawn to a square occupied by an enemy:
    enemy.update(:x_position => 2, :y_position => 4)

    puts enemy.inspect
    puts white_pawn.inspect

    put :update, :id => white_pawn.id, :x_position => 2, :y_position => 4

    white_pawn.reload
    enemy.reload

    puts enemy.inspect
    puts white_pawn.inspect

    expected = [2, 4, 0]

    actual = [white_pawn.x_position, white_pawn.y_position, enemy.active]

    assert_equal expected, actual
  end
  #test "selected piece is allowed to move if valid_move returns true" do
  #	@game = Game.create
  #	@piece = Piece.find_by(type: "Pawn", color: 1, x_position: 4, y_position: 2)
  #	dest_x = 4
  #	dest_y = 3
  	#binding.pry

  	#@piece.validate_move(dest_x, dest_y)
  #	flunk
  	#assert_redirected_to(piece_path(id: @piece.id, x_position: dest_x, y_position: dest_y), method: :put)
  	#assert_equal expected, actual

  # end
end
