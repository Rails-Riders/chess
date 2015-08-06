class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

 def is_obstructed?(start_x, start_y, dest_x, dest_y)

 	#board for testing?
    board = [
              ['r','k',nil,'q', 'nil', 'b', 'n', 'r'],
              ['p', 'p', nil, nil,'p','p','p', 'p'],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, 'p', 'n', nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              ['b', 'p', nil, nil, nil, nil, nil, 'b'],
              [nil, nil, 'p', 'p', 'p', 'p', 'p', 'p'],
              ['r',nil, nil,'q', 'k', 'b', 'n', 'r']
            ]

    # For horizontal 
    if start_x == dest_x
      if start_y < dest_y
        return true if for_horizontal_movement(start_y, dest_y, start_x, board, 1)
      end
      if start_y > dest_y
        return true if for_horizontal_movement(start_y, dest_y, start_x, board, -1)
      end
    end

    #For vertical 
    if start_y == dest_y
      if start_x < dest_x
        return true if for_vertical_movement(start_x, dest_x, start_y, board, 1) 
      end
      if start_x > dest_x
        return true if for_vertical_movement(start_x, dest_x, start_y, board, -1) 
      end
    end

    #For diagonal 
    if start_x != dest_x && start_y != dest_y
      if start_x < dest_x && start_y < dest_y 
        return true if for_diagonal_movement_left_to_right(start_x, dest_x, start_y, dest_y, board, 1 )
      end
      if start_x < dest_x && start_y > dest_y
        return true if for_diagonal_movement_right_to_left(start_x, dest_x, start_y, dest_y, board, 1, -1)
      end
       if start_x > dest_x && start_y > dest_y
        return true if for_diagonal_movement_left_to_right(start_x, dest_x, start_y, dest_y, board, -1 )
      end
       if start_x > dest_x && start_y < dest_y
        return true if for_diagonal_movement_right_to_left(start_x, dest_x, start_y, dest_y, board, -1, 1)
      end
    end  
  end#End is_obstructed?

  #For Horizontal
  def for_horizontal_movement(start_y, dest_y, start_x, board, increment)
    new_y = start_y
      while new_y - dest_y != 0
        new_y = new_y + increment
        if board[start_x][new_y] != nil
          return true
        end
      end
  end 

  #For Vertical
  def for_vertical_movement(start_x, dest_x, start_y, board, increment)
    new_x = start_x
     while new_x - dest_x != 0
       new_x = new_x + increment
       if board[new_x][start_y] != nil
         return true
       end
     end
  end

  #For Diagonal Left to Right
  def for_diagonal_movement_left_to_right(start_x, dest_x, start_y, dest_y, board, increment )
    new_x = start_x
      new_y = start_y
        while new_x - dest_x != 0 && new_y - dest_y != 0
          new_x = new_x + increment
          new_y = new_y + increment
          if board[new_x][new_y] != nil
            return true
          end
        end
  end

  #For Diagonal Right to Left
  def for_diagonal_movement_right_to_left(start_x, dest_x, start_y, dest_y, board, increment1, increment2 )
    new_x = start_x
      new_y = start_y
        while new_x - dest_x != 0 && new_y - dest_y != 0
          new_x = new_x + increment1
          new_y = new_y + increment2
          if board[new_x][new_y] != nil
            return true
          end
        end
  end



end#End Piece Class
