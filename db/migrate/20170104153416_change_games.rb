class ChangeGames < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.remove  :current_player
      t.text    :players_order
      t.integer :turn_index
    end
  end
end
