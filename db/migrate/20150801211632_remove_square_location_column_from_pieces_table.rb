class RemoveSquareLocationColumnFromPiecesTable < ActiveRecord::Migration
  def change
    remove_column :pieces, :square_location
  end
end
