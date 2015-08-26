class RenameTypeToTypeFromPiecesTable < ActiveRecord::Migration
  def change
  	rename_column :pieces, :piece_type, :type
  end
end
