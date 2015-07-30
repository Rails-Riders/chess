class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
    	t.string  :type   
    	t.integer :active
    	t.text    :square_location
    	t.integer :game_id
    	t.integer :player_id

    	t.timestamps
        t.references :pieces, index: true
    end
  end
end
