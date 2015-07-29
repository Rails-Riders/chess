class AddPieceTypeToPieces < ActiveRecord::Migration

  def change
  	rename_column :pieces, :type, :pieces_id
  end
end
