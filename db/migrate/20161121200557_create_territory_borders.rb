class CreateTerritoryBorders < ActiveRecord::Migration
  def change
    create_table :territory_borders do |t|
      t.string  :name
      t.text    :borders  		#array
    end
  end
end
