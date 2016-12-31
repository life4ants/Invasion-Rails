module GameCode

	def start_game(game)
		#shuffle cards
		if game.random_select
			owners = Array(90)
			users = game.player_ids
			num = 0
			90.times do |n|
				owners[n] = users[num]
				num += 1
				if num >= game.num_of_players
					num = 0
				end
			end
			owners.shuffle!.shuffle!
			territory_owners = Array(90)
			90.times do |n|
				territory_owners[n] = {game_id: game.id, territory_id: n+1, player_id: owners[n]}
			end
			game.game_territories.create(territory_owners)
		else
			#do selectable stuff
		end
		users = game.user_ids
		users.each do |user|
			Pusher.trigger('notifications', 'user#{user}', { message: 'The game #{game.nick_name} is now active and ready to play.' })
		end
	end
end