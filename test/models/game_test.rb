require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "number of pawns" do
    game = Game.create

    # puts Piece.where( :type => 'Pawn').inspect

    num_of_pawns = Piece.where( :type => 'Pawn' ).count

    assert_equal 16, num_of_pawns
  end

  test "number of rooks" do
    game = Game.create

    # puts Piece.where( :type => 'Rook').inspect

    num_of_rooks = Piece.where( :type => 'Rook' ).count

    assert_equal 4, num_of_rooks
  end

  test "number of knights" do
    game = Game.create

    # puts Piece.where( :type => 'Knight').inspect

    num_of_knights = Piece.where( :type => 'Knight' ).count

    assert_equal 4, num_of_knights
  end

  test "number of bishops" do
    game = Game.create

    # puts Piece.where( :type => 'Bishop').inspect

    num_of_bishops = Piece.where( :type => 'Bishop' ).count

    assert_equal 4, num_of_bishops
  end

  test "number of queens" do
    game = Game.create

    # puts Piece.where( :type => 'Queen').inspect

    num_of_queens = Piece.where( :type => 'Queen' ).count

    assert_equal 2, num_of_queens
  end

  test "number of kings" do
    game = Game.create

    # puts Piece.where( :type => 'King').inspect

    num_of_kings = Piece.where( :type => 'King' ).count

    assert_equal 2, num_of_kings
  end

  test "number of chess pieces is 32" do
    Game.create

    num_of_pieces = Piece.count

    assert_equal 32, num_of_pieces
  end

  test "number of pieces with default values" do
    game = Game.create

    num_of_pieces = Piece.where( :active => 1, :game_id => game.id ).count

    assert_equal 32, num_of_pieces
  end

  # This test is not able to query for an array
  # test "white king's square location" do
  #   game = Game.create
  #   puts Piece.find_by( :type => 'King').inspect
  #   num_of_kings = Piece.find_by( :square_location => [5, 1] ).count

  #   assert_equal 1, num_of_kings
  # end

end
