class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	def self.types
		%w(Pawn Rook Knight Bishop Queen King)
	end

end
