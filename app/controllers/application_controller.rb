class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :piece_color
  def piece_color(piece)
    case 
      when piece.color == 0 then "Black\n" + piece.type
      when piece.color == 1 then "White\n" + piece.type
      else
    end
  end
end
