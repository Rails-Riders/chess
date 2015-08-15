require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "show board for selected game == 1" do 
    game_id = '1'
    assert_routing '/games/1', {action: "show", controller: "games", id: game_id}
  end
end
