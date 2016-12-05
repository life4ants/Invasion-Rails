module GameCode

def start_game(game)
		#shuffle cards
		if game.random_select
			a = Array(90)
			users = game.user_ids
			num = 0
			90.times do |n|
				a[n] = users[num]
				num += 1
				if num >= game.num_of_players
					num = 0
				end
			end
			a.shuffle!.shuffle!
			h = Hash.new
			90.times do |n|
				h[:"terr#{n+1}Owner"] = a[n]
			end
			game.territory_owners.first.update(h)
		else
			#do selectable stuff
		end
		h = Hash.new
		90.times do |n|
			h[:"terr#{n+1}Reserves"] = 1
		end
		game.territory_reserves.first.update(h)
	end

end