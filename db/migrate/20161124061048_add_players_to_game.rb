class AddPlayersToGame < ActiveRecord::Migration
  def change
    add_column :games, :num_of_players, :integer
    add_column :games, :nick_name, :string
  end
end
