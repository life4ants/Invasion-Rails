module GamesHelper
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
	def territory_owner(territory)
		num = @game.territory_owners.first[:"terr#{territory}Owner"]
		user = User.find(num)
		gravatar_for(user, size: 20, class: "gravatar circle-img color#{num}")
	end	
end
