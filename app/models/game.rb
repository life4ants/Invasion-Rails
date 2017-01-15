class Game < ApplicationRecord
	has_many :players, dependent: :destroy
  has_many :users, through: :players
  has_many :game_territories, dependent: :destroy
  has_many :territories, through: :game_territories
  has_many :shuffled_cards, dependent: :destroy
  has_many :messages, dependent: :destroy

  serialize :players_order

  validates :num_of_players, presence: true, numericality:
   												{ only_integer: true, less_than: 9, greater_than: 2 }

  def current_player
    self.players.find_by(turn_order: self.turn_index)
  end
end
