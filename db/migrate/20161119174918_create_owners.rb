class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
    	t.integer :game_id
   		90.times do |n|
   			t.integer :"terrOwner#{n+1}"
   		end
    end

  end
end
