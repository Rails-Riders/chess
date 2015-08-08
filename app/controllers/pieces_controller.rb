class PiecesController < ApplicationController

	def show
		@current_piece = Piece.find(params[:id])
		@pieces = @current_piece.game.pieces
		render "shared/chessboard"
	end

	def update
	end

	private

	def piece_params
		params.require(:piece).permit(:type, :game_id, :x_position, :y_position, :color)
	end
end
