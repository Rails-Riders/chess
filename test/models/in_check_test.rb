require 'test_helper'

class GameInCheckTest < ActiveSupport::TestCase
  test "game in check state" do
     g = Game.create
     expected = true

     p = g.pieces.find_by(x_position: 4, y_position: 2, type: 'pawn', color: "black")
     k = g.pieces.find_by(x_position: 5, y_position: 1, color: "white", type: 'King')

     p.valid_move?(king.x_position: 5, king.y_position: 1)

     assert_equal true, g.in_check?(1)
  end

end
