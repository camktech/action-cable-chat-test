class ChatRoomChannel < ApplicationCable::Channel
  # def subscribed
  #   # stream_from "some_channel"
  # end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end

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
    stream_from("chat_channel_#{params[:room_id]}")
    ActionCable.server.broadcast("chat_channel_#{params[:room_id]}", message: data['message'])
  end
end
