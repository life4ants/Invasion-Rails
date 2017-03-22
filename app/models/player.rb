class Player < ApplicationRecord
	belongs_to :game
	belongs_to :user
  has_many :game_territories
  has_many :territories, through: :game_territories

	serialize :cards
	validates :user_id, presence: true
  validates :game_id, presence: true
  validates :icon, presence: true, numericality:
                          { only_integer: true, less_than: 100, greater_than: -1 }

  def public_attr
    attributes = self.attributes.slice("id", "user_id", "turn_order")
    attributes["name"] = self.user.name
    return attributes
  end
end
