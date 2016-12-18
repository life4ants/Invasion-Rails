class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :nick_name
      t.integer   :num_of_players
    	t.integer		:turn_index,    default: 1
    	t.boolean		:random_select
      t.boolean   :wins_tie
      t.integer   :num_of_cards
    	t.integer		:card_set_value, default: 4
    	t.string		:phase,          default: "initialTroops"
    	t.boolean		:active,         default: false
    	t.boolean   :play_started,   default: false
    	t.integer		:next_card,      default: 1
    	t.integer		:round,          default: 1

      t.timestamps null: false
    end
  end
end
