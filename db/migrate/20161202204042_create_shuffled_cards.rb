class CreateShuffledCards < ActiveRecord::Migration
  def change
    create_table :shuffled_cards do |t|
    	t.references :game, index: true, foreign_key: true
      92.times do |n|
        t.integer :"card#{n+1}"
      end
    end
  end
end
