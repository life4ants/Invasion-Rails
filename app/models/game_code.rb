module GameCode

  def start_game(game)
    #shuffle cards
    if game.random_select
      owners = []
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

  def update_initial_troops(data, game, temp_reserves)
    current_player = game.current_player
    data.each do |n|
      terr = game.game_territories.find_by(territory_id: n[0].to_i)
      n[1] += terr.troops
      terr.troops = n[1]
      terr.save!
    end
    current_player.update!(reserves: current_player.reserves - temp_reserves)
    assign_temp_reserves(current_player)
    current_player = next_player(game)
    if current_player.reserves > 0
      ActionCable.server.broadcast "Game_#{game.id}", type: "initialTroops", terr_data: data,
                                  current_player: current_player.public_attr, turn_index: game.turn_index
    else
      shift_players(game)
      start_turn(current_player, game, data)
    end
    return {success: true}
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
    when 0
      player.update!(temp_reserves: 0)
    end
  end

  def next_player(game)
    turn_index = game.turn_index + 1
    turn_index = 1 if turn_index > game.num_of_players
    game.update!(turn_index: turn_index)
    current_player = game.current_player
  end

  def shift_players(game)
    offset = game.turn_index-1
    return if offset == 0
    game.players.each do |player|
      index = player.turn_order - offset
      if index < 1
        player.update!(turn_order: index + game.num_of_players)
      else
        player.update!(turn_order: index)
      end
    end
    game.update!(turn_index: 1)
  end

  def start_turn(player, game, last_move_data)
    troops_info = assign_troops(player, game)
    game.update!(phase: "addTroops")
    player.update!(can_turn_in_cards: true, reserves: troops_info[:troops])
    ActionCable.server.broadcast "Game_#{game.id}", type: "addTroops", terr_data: last_move_data,
                messages: troops_info[:messages], current_player: player.public_attr, turn_index: game.turn_index
  end

  def assign_troops(player, game)
    player_territories = player.game_territory_ids
    terr_count = player_territories.length
    continents = check_for_continent(player_territories)
    con_data = continent_messages(continents)
    if game.round == 1
      terr_troops = terr_count/4 > 4 ? terr_count/4 : 4
    else
      terr_troops = terr_count/3 > 3 ? terr_count/3 : 3
    end
    con_data[:troops] += terr_troops
    name = player.user.name
    con_data[:messages].prepend("#{name}, you have #{terr_count} territories. This gives you #{terr_troops} troops.")
    con_data[:messages].append("#{name}, you have #{con_data[:troops]} troops to distribute.")
    return con_data
  end

  def continent_messages(continents)
    output = {troops: 0, messages: []}
    data = [
      {troops: 8, message: "You get 8 troops for owning Canada"},
      {troops: 7, message: "You get 7 troops for owning Northeastern US"},
      {troops: 4, message: "You get 4 troops for owning Southeastern US"},
      {troops: 9, message: "You get 9 troops for owning Central US"},
      {troops: 5, message: "You get 5 troops for owning Western US"},
      {troops: 7, message: "You get 7 troops for owning Northern Mexico"},
      {troops: 7, message: "You get 7 troops for owning Southern Mexico"},
      {troops: 3, message: "You get 3 troops for owning Central America"},
      {troops: 2, message: "You get 2 troops for owning the Caribbean"}
    ]
    continents.length.times do |n|
      if continents[n]
        output[:messages].push(data[n][:message])
        output[:troops] += data[n][:troops]
      end
    end
    return output
  end

  def check_for_continent(player_territories)
    continents = [
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
      [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26],
      [27, 28, 29, 30, 31, 32, 33],
      [34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48],
      [49, 50, 51, 52, 53, 54, 55],
      [56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67],
      [68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78],
      [79, 80, 81, 82, 83, 84, 85],
      [86, 87, 88, 89, 90] ]
    output = Array(9)
    9.times do |n|
      player_territories.contains_all?(continents[n]) ? output[n] = true : output[n] = false
    end
    return output
  end
end



