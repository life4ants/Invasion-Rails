class Player < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
  has_many :game_territories
  has_many :territories, through: :game_territories

	serialize :cards
	validates :user_id, presence: true
  validates :game_id, presence: true
  validates :icon, presence: true
end
