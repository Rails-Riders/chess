class PiecesController < ApplicationController
	before_action :select_pc, :only => [:show, :update]
	before_action :only => :update do 
		validate_move(:x_position, :y_position)
	end
	before_action :only => :update do
		state_of_game(:player_turn)
	end

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
		color == 0 ? your_color = "White" : your_color = "Black"
		if select_pc.game.in_check?(color)
			flash[:alert] = "#{your_color}, you are in check!" 
		end
	end

	def validate_move(x_position, y_position)
		row = params[:y_position].to_i
		col = params[:x_position].to_i
		if [!select_pc.valid_move?(col, row), select_pc.nil_move?(col, row),
				select_pc.prevent_check?].any?
			if select_pc.prevent_check?
				flash[:alert] = "You cannot put yourself in check"
			else
				flash[:alert] = "That move is not allowed!  Please choose your piece and try again."
			end
			redirect_to game_path(select_pc.game.id)
		end
	end

	def select_pc
		@select_pc = Piece.find(params[:id])
	end
end
