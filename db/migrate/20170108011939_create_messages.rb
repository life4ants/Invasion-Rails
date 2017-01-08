class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :game,  index: true, foreign_key: true
      t.text :content
      t.string :sender

      t.timestamps
    end
  end
end
