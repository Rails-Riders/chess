class PiecesController < ApplicationController

	def show
		@select_pc = Piece.find(params[:id])
		@game = @select_pc.game.id
		@pieces = Game.find(@game).pieces
		render "shared/_chessboard"
	end

	def update
	end

	private

	def piece_params
		params.require(:piece).permit(:type, :game_id, :x_position, :y_position, :color)
	end
end
