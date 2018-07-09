class TopicsChannel < ApplicationCable::Channel
  require 'pry'
  def subscribed
    puts params[:topic_id]
    stream_from "topic_channel_#{params[:topic_id]}"
    # binding.pry
  end

  def unsubscribed
    puts "*********unsubscribed"
    # Any cleanup needed when channel is unsubscribed
  end
end
