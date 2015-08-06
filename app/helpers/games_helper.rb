module GamesHelper
  def piece_color(piece)
    case 
      when piece.color == 0 then "Black\n" + piece.type
      when piece.color == 1 then "White\n" + piece.type
    end
  end
end
