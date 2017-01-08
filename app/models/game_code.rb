module GameCode

  def start_game(game)
    #shuffle cards
    if game.random_select
      owners = Array(90)
      users = game.players_order
      num = game.num_of_players -1
      90.times do |n|
        owners[n] = users[num]
        num -= 1
        num = game.num_of_players -1 if num < 0
      end
      owners.shuffle!.shuffle!
      territory_owners = Array(90)
      90.times do |n|
        territory_owners[n] = {game_id: game.id, territory_id: n+1, player_id: owners[n]}
      end
      game.game_territories.create!(territory_owners)
    else
      #do selectable stuff
    end
    assign_troops(game)
    game.users.each do |user|
      ActionCable.server.broadcast 'notifications_channel_#{user.id}',
      content: "#{user.name}, the game #{game.nick_name} is now active and ready for you to start playing."
    end
  end

  def assign_troops(game)
    case game.num_of_players
    when 3
      game.players.update_all(reserves: 42, temp_reserves: 9)
    when 4
      game.players.limit(2).update_all(reserves: 37, temp_reserves: 9)
      game.players.offset(2).limit(2).update_all(reserves: 36, temp_reserves: 9)
    when 5
      game.players.update_all(reserves: 33, temp_reserves: 9)
    when 6
      game.players.update_all(reserves: 30, temp_reserves: 8)
    when 7
      game.players.first.update(reserves: 28, temp_reserves: 5)
      game.players.offset(1).update_all(reserves: 27, temp_reserves: 5)
    when 8
      game.players.limit(6).update_all(reserves: 25, temp_reserves: 5)
      game.players.offset(6).update_all(reserves: 24, temp_reserves: 5)
    else
      raise 'wrong number of players to assign troops to'
    end
  end
end