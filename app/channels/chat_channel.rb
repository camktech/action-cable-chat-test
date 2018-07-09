class ChatChannel < ApplicationCable::Channel

  def subscribe
    puts "subbed"
    stream_from("chat_channel_#{params[:room_id]}")
  end

  def unsubscribe
    puts "*************unsubscribe"
  end

  def speak(data)
    ActionCable.server.broadcast("chat_channel_#{params[:room_id]}", message: data['message'])
  end

  def receive(data)
    ActionCable.server.broadcast("chat_channel_#{params[:room_id]}", message: data['message'])
  end

end
