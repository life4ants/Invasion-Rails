class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.string   :name
      t.string   :group
      t.text     :borders
    end
    add_index :territories, :group
  end
end
