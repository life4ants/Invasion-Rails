class CreateSortedCards < ActiveRecord::Migration
  def change
    create_table :sorted_cards do |t|
    		t.string  :name
    		t.integer :case
    		t.integer :number
    end
  end
end
