class PiecesController < ApplicationController
  before_action :select_pc, :only => [:show, :update]
  before_action :only => :update do
    validate_move(:x_position, :y_position)
  end

  def show
    @pieces = select_pc.game.pieces
  end

  def update
    row = params[:y_position].to_i
    col = params[:x_position].to_i

    @select_pc.move_to!(col, row)

    redirect_to game_path(select_pc.game.id)

    # change_player_turn(color)
  end

  private

  def validate_move(x_position, y_position)
    row = params[:y_position].to_i
    col = params[:x_position].to_i

    if !select_pc.my_turn?(select_pc)
      flash[:alert] = "Be patient...it's not your turn yet."
      redirect_to game_path(select_pc.game.id)
    elsif !select_pc.valid_move?(col, row) || select_pc.nil_move?(col, row)
      flash[:alert] = "That move is not allowed!  Please choose your piece and try again."
      redirect_to game_path(select_pc.game.id)
    end
  end

  def select_pc
    @select_pc = Piece.find(params[:id])
  end
end
