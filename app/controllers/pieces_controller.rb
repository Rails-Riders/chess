class PiecesController < ApplicationController
	before_action :select_pc, :only => [:show, :update]

	def show
		@pieces = select_pc.game.pieces
	end

	def update
		row, col = params[:y_position].to_i,
		           params[:x_position].to_i
		if moved = select_pc.valid_move?(col, row)
		  select_pc.update_attributes(y_position: row, 
		  	                          x_position: col)
		end

		render json: select_pc.to_json, 
		       status: moved ? :ok : 422
	end

	private

	def select_pc
		@select_pc = Piece.find(params[:id])
	end

	def piece_params
		params.require(:piece).permit(
			:type, :game_id, :x_position, :y_position, :color)
	end
end
