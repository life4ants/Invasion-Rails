class AddIconToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :icon, :integer
  end
end
