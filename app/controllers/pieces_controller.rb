class PiecesController < ApplicationController

	def show
		@piece = Piece.find(params[:id])
		@game = @piece.game
		render "shared/chessboard"
	end

	def update
	end

	private

	def piece_params
		params.require(:piece).permit(:type, :game_id, :x_position, :y_position, :color)
	end
end
