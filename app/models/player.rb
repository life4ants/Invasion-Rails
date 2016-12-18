class Player < ActiveRecord::Base
	belongs_to :game
	belongs_to :user

	serialize :cards
	validates :user_id, presence: true
  validates :game_id, presence: true
  validates :icon, presence: true
end
