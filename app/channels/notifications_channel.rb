# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
     stream_from "notifications_channel"
     stream_from "notifications_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def user
  end

  def player(message)
    ActionCable.server.broadcast 'notifications_channel', content: message
  end
end
