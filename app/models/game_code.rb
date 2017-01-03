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
				num = 0 if num >= game.num_of_players
			end
			owners.shuffle!.shuffle!
			territory_owners = Array(90)
			90.times do |n|
				territory_owners[n] = {game_id: game.id, territory_id: n+1, player_id: owners[n]}
			end
			game.game_territories.create!(territory_owners)
			game.update!(current_player: users[0])
		else
			#do selectable stuff
		end
		users = game.users
		users.each do |user|
			ActionCable.server.broadcast 'notifications_channel_#{user.id}',
			content: "#{user.name}, the game #{game.nick_name} is now active and ready for you to start playing."
		end
	end
end