require 'pry'
class PiecesController < ApplicationController
	before_action :select_pc, :only => [:show, :update]
	before_action :only => :update do
		validate_move(:x_position, :y_position)
	end
	#after_action :only => :update do
	#	state_of_game(:player_turn)
	#end

	def show
		@pieces = select_pc.game.pieces
	end

	def update
		row = params[:y_position].to_i
		col = params[:x_position].to_i
		select_pc.move_to!(col, row)
		redirect_to game_path(select_pc.game.id)
	end

  private

	def state_of_game(color)
    color = (color - 1).abs
		if select_pc.game.in_check?(your_color)
			flash[:alert] = "#{your_color}, you are in check!"
		end
	end

	def validate_move(x_position, y_position)
		row = params[:y_position].to_i
		col = params[:x_position].to_i
    color = select_pc.color
		if invalid_move?(col, row)
      flash[:alert] = "That move is not allowed!  Please choose your piece and try again."
    elsif put_self_in_check?(color, col, row)
      flash[:alert] = "You cannot put yourself in check"
    else
      return true
    end
    redirect_to game_path(select_pc.game.id)
    return false
	end

  def invalid_move?(col, row)
    !select_pc.valid_move?(col, row) || select_pc.nil_move?(col, row)
  end

  def put_self_in_check?(color, col, row)
    select_pc.game.checking_piece?(color, select_pc.id, col, row)
  end

  def your_color
    color == 0 ? your_color = "White" : your_color = "Black"
  end

  def select_pc
    @select_pc = Piece.find(params[:id])
  end
end
