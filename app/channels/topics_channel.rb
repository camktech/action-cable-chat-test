class TopicsChannel < ApplicationCable::Channel
  def subscribed
    @user_data = params[:current_user]
    @topic = Topic.find_by(id: params[:topic_id])
    @channel_name = "topic_channel_#{params[:topic_id]}"
    stream_from @channel_name
  end

  def unsubscribed
    puts "()*&(*@)*&@(*^!@*^!@(*^@unsubscribed"
  end

  def receive(data)
    ActionCable.server.broadcast(@channel_name, data)
  end
end
