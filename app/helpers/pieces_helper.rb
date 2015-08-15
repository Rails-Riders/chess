module PiecesHelper
	 def hilite(piece)
  	current_page?(controller: 'pieces', action: 'show', id: piece.id) ? 'hilite' : ''
  end
end
