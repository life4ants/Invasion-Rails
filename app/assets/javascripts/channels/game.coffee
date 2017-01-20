App.game = App.cable.subscriptions.create {channel: "GameChannel", game_id: gon.game.id},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
    subscription = App.cable.subscriptions.subscriptions[1]
    App.cable.subscriptions.remove(subscription)
    console.log("disconnected from websockets")
    setTimeout (-> App.cable.subscriptions.create {channel: "GameChannel", game_id: gon.game.id}
    1000 )

  received: (data) ->
    console.log(data)
    if data.type == "initialTroops" || data.type == "addTroops"
      isCurrentPlayer = gon.user_player.id == gon.current_player.id
      if !isCurrentPlayer
        update_map(data.terr_data)
      gon.game.turn_index = data.turn_index
      gon.current_player = data.current_player
      gon.game.phase = data.type
      messages = data.messages || []
      window.isMyTurn = gon.user_player.id == data.current_player.id
      if window.isMyTurn
        update_gon()
      show_dependent_info(messages)
      onResize()



