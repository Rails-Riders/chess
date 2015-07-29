class Piece < ActiveRecord::Base
	
	serialize :square_location


	belongs_to :user
	belongs_to :game
end
