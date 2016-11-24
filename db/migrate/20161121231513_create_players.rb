class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.references :game, index: true, foreign_key: true
    	t.references :user, index: true, foreign_key: true
        t.boolean    :admin, default: false
        t.integer    :reserves, default: 0
    	t.integer    :temp_reserves, default: 0
    	t.text		 :cards  						#array
    	t.boolean    :can_turn_in_cards, default: false
    	t.boolean    :getsACard, default: false
    	t.boolean    :mustTurnInCards, default: false
    	t.integer    :numOfPasses, default: 0
    	t.integer    :sets_turned_in, default: 0
    end
  end
end

			