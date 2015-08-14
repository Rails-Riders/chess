require 'pry'
class PiecesController < ApplicationController

	def show
		@select_pc = Piece.find(params[:id])
		@game = @select_pc.game.id
		@pieces = Game.find(@game).pieces
	end

	def update
		@select_pc = Piece.find(params[:id])
		row = params[:y_position]
		col = params[:x_position]
		@moved_pc = @select_pc.update_attributes(y_position: row, x_position: col)
		redirect_to game_path(@select_pc.game.id)
	end

	private


	def piece_params
		params.require(:piece).permit(:type, :game_id, :x_position, :y_position, :color)
	end
end
