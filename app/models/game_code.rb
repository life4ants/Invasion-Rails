module GameCode

def start_game(game)
		#shuffle cards
		if game.random_select
			a = Array(1..90)
			num = 1
			90.times do |n|
				a[n] = num
				num += 1
				if num > game.num_of_players
					num = 1
				end
			end
			a.shuffle.shuffle!
			90.times do |n|
				game.territory_owners.first[:"terr#{n+1}Owners"] = a[n]

			end
			game.territory_owners.save!
		else
			#do selectable stuff
		end
		90.times do |n|
			game.territory_reserves.first[:"terr#{n+1}Reserves"] = 1
		end
		game.territory_reserves.save!
	end

end