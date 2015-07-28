class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

		t.integer :game_state
		t.integer :player_turn
		t.integer :turn_count
		t.integer :black_player_id
		t.integer :white_player_id
		t.integer :winning_player_id
		t.integer :user_id

      	t.timestamps
    end
  end
end
