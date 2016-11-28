module GameHelper
	def creator_of(game)
		game.players.where(admin:true).first.user.name
	end
	def is_creator_of?(game)
		current_user == game.players.where(admin:true).first.user
	end
	def has_joined(game)
		players = game.player_ids
		players.each do |id|
			if Player.find(id).user == current_user
				return true
			end
		end
		return false
	end
end
