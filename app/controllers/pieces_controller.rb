require 'pry'
class PiecesController < ApplicationController
	before_action :select_pc, :only => [:show, :update]

	def show
		@pieces = select_pc.game.pieces
	end

	def update
		row = params[:y_position]
		col = params[:x_position]
		@moved_pc = select_pc.update_attributes(y_position: row, x_position: col)
		redirect_to game_path(select_pc.game.id)
	end

	private

	def select_pc
		@select_pc = Piece.find(params[:id])
	end

	def piece_params
		params.require(:piece).permit(:type, :game_id, :x_position, :y_position, :color)
	end
end
