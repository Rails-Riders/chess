class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
	end

	def show
		@game = Game.find(params[:id])
		@pieces = @game.pieces
		
	end
  
  private

  def game
  	@game ||= Game.where(id: params[:id])
  end

  def game_params
  	params.require(:game).permit(
  		:white_player_id, 
  		:black_player_id)
  end
end
