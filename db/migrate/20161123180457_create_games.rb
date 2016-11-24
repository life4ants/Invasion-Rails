class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer		:turn_index
    	t.text			:settings 			#array
    	t.integer		:card_set_value, default: 4
    	t.string		:phase
    	t.boolean		:active
    	t.boolean   :play_started
    	t.integer		:next_card
    	t.integer		:round

      t.timestamps null: false
    end
  end
end
