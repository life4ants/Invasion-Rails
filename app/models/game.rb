class Game < ActiveRecord::Base
	has_many :players, dependent: :destroy
  has_many :users, through: :players
  has_many :territory_owners, dependent: :destroy
  has_many :territory_reserves, dependent: :destroy, class_name: "TerritoryReserve"
  has_many :shuffled_cards, dependent: :destroy

  serialize :settings

  validates :num_of_players, presence: true, numericality:
   												{ only_integer: true, less_than: 9, greater_than: 2 }
end
