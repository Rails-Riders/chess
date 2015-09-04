require 'test_helper'

class GameInCheckTest < ActiveSupport::TestCase
  test "game in check state" do
     g = Game.create
     expected = true

     black_p = g.pieces.find_by(:x_position => 4, :y_position => 7, :type => 'Pawn', color: 0)
     deactivate_white_pawn = g.pieces.find_by(:x_position => 4, :y_position => 2).update_attributes(:active => 0)
     black_p.update_attributes(:y_position => 2)

     white_k = g.pieces.find_by(:x_position => 5, :y_position => 1, :color => 1, :type => 'King')
     check_color = white_k.color
     position_in_check = black_p.x_position, black_p.y_position
     actual = g.checking_piece?(black_p.id, check_color, *position_in_check)

     assert_equal expected, actual
  end

end
