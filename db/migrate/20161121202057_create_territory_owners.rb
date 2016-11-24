class CreateTerritoryOwners < ActiveRecord::Migration
  def change
    create_table :territory_owners do |t|
    	 t.references :game, index: true, foreign_key: true
      90.times do |n|
        t.integer :"terr#{n+1}Owner"
      end
    end
  end
end
