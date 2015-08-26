require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "number of pawns" do
    game = Game.create

    num_of_pawns = game.pieces.where( :type => 'Pawn' ).count

    assert_equal 16, num_of_pawns
  end

  test "correct pawn positions" do
    game = Game.create

    correct_positions = [[2, 2], [1, 2], [3, 2], [4, 2],
                         [5, 2], [6, 2], [7, 2], [8, 2],
                         [1, 7], [2, 7], [3, 7], [4, 7],
                         [5, 7], [6, 7], [7, 7], [8, 7]]

    actual_positions = game.pieces.where( :type => 'Pawn' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result =  correct_positions - actual_positions

    assert_equal [], result, "The starting pawn position(s) of #{result} are incorrect"
  end

  test "number of rooks" do
    game = Game.create

    num_of_rooks = game.pieces.where( :type => 'Rook' ).count

    assert_equal 4, num_of_rooks
  end

  test "correct rook positions" do
    game = Game.create

    correct_positions = [[1, 1], [8, 1], [1, 8], [8, 8]]

    actual_positions = game.pieces.where( :type => 'Rook' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result = correct_positions - actual_positions

    assert_equal [], result, "The starting rook position(s) of #{result} are incorrect"
  end

  test "number of knights" do
    game = Game.create

    num_of_knights = game.pieces.where( :type => 'Knight' ).count

    assert_equal 4, num_of_knights
  end

  test "correct knight positions" do
    game = Game.create

    correct_positions = [[2, 1], [7, 1], [2, 8], [7, 8]]

    actual_positions = game.pieces.where( :type => 'Knight' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result = correct_positions - actual_positions

    assert_equal [], result, "The starting knight position(s) of #{result} are incorrect"
  end

  test "number of bishops" do
    game = Game.create

    num_of_bishops = game.pieces.where( :type => 'Bishop' ).count

    assert_equal 4, num_of_bishops
  end

  test "correct bishop positions" do
    game = Game.create

    correct_positions = [[3, 1], [6, 1], [3, 8], [6, 8]]

    actual_positions = game.pieces.where( :type => 'Bishop' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result = correct_positions - actual_positions

    assert_equal [], result, "The starting bishop position(s) of #{result} are incorrect"
  end

  test "number of queens" do
    game = Game.create

    num_of_queens = game.pieces.where( :type => 'Queen', :game_id => game.id ).count

    assert_equal 2, num_of_queens
  end

  test "correct queen positions" do
    game = Game.create

    actual_positions = [[4, 1], [4, 8]]

    positions = game.pieces.where( :type => 'Queen' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result = actual_positions - positions

    assert_equal [], result, "The starting queen position(s) of #{result} are incorrect"
  end

  test "number of kings" do
    game = Game.create

    num_of_kings = game.pieces.where( :type => 'King' ).count

    assert_equal 2, num_of_kings
  end

  test "correct king positions" do
    game = Game.create

    actual_positions = [[5, 1], [5, 8]]

    positions = game.pieces.where( :type => 'King' ).pluck( :x_position, :y_position )

    # result should be an empty array if the positions are correct
    result =  actual_positions - positions

    assert_equal [], result, "The starting king position(s) of #{result} are incorrect"
  end

  test "number of chess pieces is 32" do
    game = Game.create

    num_of_pieces = game.pieces.count

    assert_equal 32, num_of_pieces
  end

  test "number of pieces with default values" do
    game = Game.create

    num_of_pieces = game.pieces.where( :active => 1, :game_id => game.id ).count

    assert_equal 32, num_of_pieces
  end

  test "number of queens when 2 games are created" do
    # Create 2 games to test if the appropriate number of queens are generated
    # for a given game
    game = Game.create
    another_game = Game.create

    game_queens = game.pieces.where( :type => 'Queen', :game_id => game.id ).count

    assert_equal 2, game_queens
  end

  test "show page for game == 1" do
    game = Game.create(id: 1)
    puts game.inspect
    # @selected_piece = Piece.where(type: "Queen", color: "1")
    # @pieces = @game.pieces

    assert_generates "/games/1", {:controller => 'games', :action => 'show', :id => 1}
  end
end
