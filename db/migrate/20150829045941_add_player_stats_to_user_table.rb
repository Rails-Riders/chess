class AddPlayerStatsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :wins, :integer, :default => 0
    add_column :users, :losses, :integer, :default => 0
    add_column :users, :draws, :integer, :default => 0
    add_column :users, :rank, :string
  end
end
