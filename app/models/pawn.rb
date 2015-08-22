class Pawn < Piece

	def valid_move?(new_x, new_y)
		[move_number_allowed?(new_y), 
			no_vertical_obstacle?(new_y), 
			not_a_backwards_move?(new_y), 
			diagonal_move_allowed?(new_x, new_y)].all?
	end

	def move_number_allowed?(new_y)
		move_number(new_y) == 1 || move_number(new_y) == 2 && first_move?(new_y)
	end

	def move_number(new_y)
		(new_y - y_position).abs
	end

	def first_move?(new_y)
	  (color == 1 && y_position == 2) || (color == 0 && y_position == 7) 
  end

	def no_vertical_obstacle?(new_y)
		if move_number(new_y) == 2 
			!is_obstructed?(x_position, new_y) && no_vertical_adjacent_obstacle?(x_position, new_y) 
		else
			(no_vertical_adjacent_obstacle?(x_position, new_y))
		end
	end

	def no_vertical_adjacent_obstacle?(x_position, new_y)
		!obstacle?(x_position, new_y)
	end

	def not_a_backwards_move?(new_y)
		color == 1 ? (new_y - y_position) > 0 : (new_y - y_position) < 0 
	end

	def diagonal_move_allowed?(new_x, new_y)
		return true if new_x == x_position
		if (new_x - x_position).abs == 1 && (new_y - y_position).abs == 1 
			capture_diagonally?(new_x, new_y) 
		else
			false
		end
	end

	def capture_diagonally?(new_x, new_y)
		obstacle?(new_x, new_y) && enemy_piece?(new_x, new_y)
	end

	def enemy_piece?(new_x, new_y)
		obstacle_piece = Piece.find_by(:x_position => new_x, :y_position => new_y)
		obstacle_piece.color != color
	end  
end