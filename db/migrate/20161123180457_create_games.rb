class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :nick_name
      t.integer   :num_of_players
    	t.integer		:turn_index
    	t.boolean		:random_select
      t.boolean   :wins_tie
      t.integer   :num_of_cards
    	t.integer		:card_set_value, default: 4
    	t.string		:phase
    	t.boolean		:active,         default: false
    	t.boolean   :play_started,   default: false
    	t.integer		:next_card
    	t.integer		:round

      t.timestamps null: false
    end
  end
end
