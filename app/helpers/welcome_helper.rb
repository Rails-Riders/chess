module WelcomeHelper
	def index
		@games = Game.all
	end
end
