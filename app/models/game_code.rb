module GameCode

  def start_game(game)
    #shuffle cards
    if game.random_select
      owners = Array(90)
      player_order = game.player_ids.shuffle.shuffle
      num = game.num_of_players-1
      90.times do |n|
        owners[n] = player_order[num]
        num -= 1
        num = game.num_of_players-1 if num < 0
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
    assign_players_and_troops(game, player_order)
    game.users.each do |user|
      ActionCable.server.broadcast 'notifications_channel_#{user.id}',
      content: "#{user.name}, the game #{game.nick_name} is now active and ready for you to start playing."
    end
  end

  def assign_players_and_troops(game, player_order)
    case game.num_of_players
    when 3
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: 42, temp_reserves: 9, turn_order: n+1)
        n += 1
      end
    when 4
      troops = [37,37,36,36]
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: troops[n], temp_reserves: 9, turn_order: n+1)
        n += 1
      end
    when 5
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: 33, temp_reserves: 9, turn_order: n+1)
        n += 1
      end
    when 6
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: 30, temp_reserves: 8, turn_order: n+1)
        n += 1
      end
    when 7
      troops = [28, 27, 27, 27, 27, 27, 27]
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: troops[n], temp_reserves: 5, turn_order: n+1)
        n += 1
      end
    when 8
      troops = [25, 25, 25, 25, 25, 25, 24, 24]
      n = 0
      player_order.each do |player|
        Player.find(player).update(reserves: troops[n], temp_reserves: 5, turn_order: n+1)
        n += 1
      end
    else
      raise 'wrong number of players to assign troops to'
    end
  end

  def get_new_game_data(params)
    game = Game.find(params[:game])
    time = params[:time]
    return_data = {changed: []}
    game.game_territories.each do |terr|
      if (terr.updated_at > time)
        return_data[terr.id] = {owner: terr.player_id, troops: terr.troops}
        return_data[:changed].push(terr.id)
      end
    end
    return_data[:update_time] = 1.second.ago
    return_data
  end

  def update_troops(data, game, temp_reserves)
    current_player = game.players.find_by(turn_order: game.turn_index)
    data.each do |n|
      terr = game.game_territories.find_by(territory_id: n[0].to_i)
      terr.update!(troops: terr.troops + n[1])
    end
    current_player.update!(reserves: current_player.reserves - temp_reserves)
    assign_temp_reserves(current_player)
    current_player = next_player(game)
    return {success: true, current_player: current_player}
  end

  def assign_temp_reserves(player)
    case player.reserves
    when 33..50
      player.update!(temp_reserves: 9)
    when 30..32
      player.update!(temp_reserves: 8)
    when 9..29
      player.update!(temp_reserves: 5)
    when 3..8
      player.update!(temp_reserves: 3)
    when 1..2
      player.update!(temp_reserves: 1)
    end
  end

  def next_player(game)
    turn_index = game.turn_index + 1
    turn_index = 1 if turn_index > game.num_of_players
    game.update!(turn_index: turn_index)
    current_player = game.players.find_by(turn_order: game.turn_index)
  end
end




