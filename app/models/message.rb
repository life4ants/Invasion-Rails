class Message < ApplicationRecord
  belongs_to :game

  after_create do
    ActionCable.server.broadcast "notifications_channel", sender: self.sender, content: self.content, id: self.id
  end
end
