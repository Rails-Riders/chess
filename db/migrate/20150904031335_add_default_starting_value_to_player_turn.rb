class AddDefaultStartingValueToPlayerTurn < ActiveRecord::Migration
  def up
    change_column :games, :player_turn, :integer, :default => 1
  end

  def down
    change_column :games, :player_turn, :integer, :default => nil
  end
end
