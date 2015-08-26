class Rook < Piece

	def valid_move?(dest_x, dest_y)

		return false if is_obstructed?(dest_x, dest_y) == true

		return false if (dest_x < self.x_position || dest_x > self.x_position) && (dest_y < self.y_position || dest_y > self.y_position)

		return true
	end

end