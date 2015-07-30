class RemovePiecesIdFromPiecesModel < ActiveRecord::Migration
  def self.down
  	remove_column :pieces, :pieces_id
  end
end
