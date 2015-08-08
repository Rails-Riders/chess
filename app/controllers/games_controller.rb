class GamesController < ApplicationController
	before_action :game, only: :show 
	
	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
	end

	def show
		@pieces = game.pieces
	end
  
  private

  def game
  	@game ||= Game.find(params[:id])
  end

  def game_params
  	params.require(:game).permit(
  		:white_player_id, 
  		:black_player_id)
  end
end
