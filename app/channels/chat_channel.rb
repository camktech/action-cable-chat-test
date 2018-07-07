class ChatChannel < ApplicationCable::Channel

  def subscribe
    puts params[:room]
    stream_from("chat_channel")
  end

  def speak(data)
    ActionCable.server.broadcast("chat_channel", message: data['message'])
  end

  def receive(data)
    ActionCable.server.broadcast("chat_channel", message: data['message'])
  end

end
