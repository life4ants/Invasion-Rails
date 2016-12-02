class CreateTerritoryReserves < ActiveRecord::Migration
  def change
    create_table :territory_reserves do |t|
 			t.references :game, index: true, foreign_key: true
      90.times do |n|
        t.integer :"terr#{n+1}Reserves", default: 0
      end
    end
  end
end
