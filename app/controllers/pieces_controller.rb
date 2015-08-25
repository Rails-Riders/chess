require 'pry'
class PiecesController < ApplicationController
	before_action :select_pc, :only => [:show, :update]
	before_action :only => :update do
		valid_move?(:x_position, :y_position)
	end

	def show
		@pieces = select_pc.game.pieces
	end

	def update
		row = params[:y_position].to_i
		col = params[:x_position].to_i
		@moved_pc = select_pc.update_attributes(y_position: row, x_position: col)
		redirect_to game_path(select_pc.game.id)
	end

	private

	def valid_move?(x_position, y_position)
		row = params[:y_position].to_i
		col = params[:x_position].to_i
		if !select_pc.valid_move?(col, row)
			flash[:alert] = "That move is not allowed"
			redirect_to game_path(select_pc.game.id)
		end
	end

	def select_pc
		@select_pc = Piece.find(params[:id])
	end

	def piece_params
		params.require(:piece).permit(
			:type, :game_id, :x_position, :y_position, :color)
	end
end
