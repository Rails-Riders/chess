module WelcomeHelper
	def index
		@games = Game.all
		@piecees = Piece.all
	end
end
