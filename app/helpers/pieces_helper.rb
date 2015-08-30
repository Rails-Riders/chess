module PiecesHelper
	 def hilite(piece)
  	if current_page?(controller: 'pieces', action: 'show', id: piece.id)
  		'hilite'
  	elsif current_page?(contoller: 'games', action: 'show', id: piece.game.id)
  		''
  	else
  		'inactive'
  	end
  end

  def square_link(piece)
  	current_page?(controller: 'pieces', action: 'show', id: piece.id) ? 'square-link' : 'inactive'
  end	
end
