module GamesHelper
  def piece_color(piece)
    case 
      when piece.color == 0 && piece.active == 1 then "Black\n" + piece.type
      when piece.color == 1 && piece.active == 1 then "White\n" + piece.type
    end
  end

  def board_squares(row)
  	row % 2 != 0 ? cycle('dark', 'light') : cycle('light', 'dark')
  end 
end
