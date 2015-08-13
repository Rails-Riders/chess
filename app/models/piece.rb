class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	def self.types
		%w(Pawn Rook Knight Bishop Queen King)
	end

	def piece_at(row, col)
			piece.type if row == piece.x_position && col == piece.y_position
	end

end
