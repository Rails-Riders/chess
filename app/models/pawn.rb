class Pawn < Piece

	def valid_move?(new_x, new_y)
		move_two(new_y) if first_move?(new_y) 
		!backwards_move?(new_y) ? true : (return false)
		vertical_obstacle?(new_y) ? (return false) : true
		capture_diagonally?(new_x, new_y) ? true : (return false)
		always_allowed(new_x, new_y) ? true : (return false)
	end

	def vertical_obstacle?(new_y)
		self.obstacle?(self.x_position, new_y) ? (return true) : (return false)	
	end

	def first_move?(new_y)
	  (color == 1 && y_position == 2) || (color == 0 && y_position == 7) ? true : false
  end

  def move_two(new_y)
  	(new_y - y_position) <= 2 ? (return true) :	(return false)
  end

	def backwards_move?(new_y)
		if color == 1
			(new_y - y_position) > 0 ? (return false) : (return true)
		else
			(new_y - y_position) < 0 ? (return false) : (return true)
		end
	end

	def capture_diagonally?(new_x, new_y)
		return true if self.x_position == new_x
		if (new_x - x_position).abs == 1 and (new_y - y_position).abs == 1
			if self.obstacle?(new_x, new_y) == true
			obstacle_piece = game.pieces.find_by(:x_position => new_x, :y_position => new_y)
				obstacle_piece.color == self.color ? (return false) : (return true)
			end
			return false
		end
		return false
	end

	def always_allowed(new_x, new_y)
		return true if first_move?(new_y) && (new_x == self.x_position) 
		if (new_x != self.x_position)
			return true if capture_diagonally?(new_x, new_y)
			return false
		else
			(new_y - y_position).abs == 1 ? true : false
		end
	end
end

