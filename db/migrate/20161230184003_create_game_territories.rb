class CreateGameTerritories < ActiveRecord::Migration
  def change
    create_table :game_territories do |t|
      t.references :game,      index: true, foreign_key: true
      t.references :territory, index: true, foreign_key: true
      t.references :player,    index: true, foriegn_key: true
      t.integer    :troops,    default: 1
      t.timestamps null: false
    end
  end
end
