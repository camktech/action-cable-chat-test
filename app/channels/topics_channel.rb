class TopicsChannel < ApplicationCable::Channel
  def subscribed
    puts params[:room_id]
    stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
