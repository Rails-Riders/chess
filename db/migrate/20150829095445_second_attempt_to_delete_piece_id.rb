class SecondAttemptToDeletePieceId < ActiveRecord::Migration
  def change
    remove_column :pieces, :pieces_id
  end
end
