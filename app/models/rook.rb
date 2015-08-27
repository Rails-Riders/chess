class Rook < Piece

	def valid_move?(dest_x, dest_y)

		#can not move to currently occupied square
    	return false if dest_x == self.x_position && dest_y == self.y_position
		
		#no obstructions allowed
		return false if is_obstructed?(dest_x, dest_y) == true

		#only vertical or horizontal moves allowed
		return false if (dest_x < self.x_position || dest_x > self.x_position) && (dest_y < self.y_position || dest_y > self.y_position)

		#no vertical moves off the board
		return false if dest_x < 1 || dest_x > 8
    	
    	#no horizontal moves off the board
    	return false if dest_y < 1 || dest_y > 8

    	#can not move to currently occupied square
    	return false if dest_x == self.x_position && dest_y == self.y_position
		
		return true
	end

end