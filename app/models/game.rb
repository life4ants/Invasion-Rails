class Game < ActiveRecord::Base
	has_many :players
  has_many :users, through: :players
  has_many :territory_owners
  has_many :territory_reserves, class_name: "TerritoryReserve"
  has_many :shuffled_cards

  serialize :settings

  validates :num_of_players, presence: true, numericality:
   												{ only_integer: true, less_than: 9, greater_than: 2 }
end
