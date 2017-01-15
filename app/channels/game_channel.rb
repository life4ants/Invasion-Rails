class GameChannel < ApplicationCable::Channel
  def subscribed
     stream_from "Game_#{params[:game_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
