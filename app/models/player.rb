class Player < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
  has_many :game_territories
  has_many :territories, through: :game_territories

	serialize :cards
	validates :user_id, presence: true
  validates :game_id, presence: true
  validates :icon, presence: true


  def territories
    owners = self.game.territory_owners.first
    count = 0
    (1..90).each do |n|
      count += 1 if owners["terr#{n}Owner"] == self.id
    end
    count
  end
end
