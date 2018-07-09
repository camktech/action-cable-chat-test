class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(name: params[:name])
    redirect_to @topic
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    if @topic.nil?
      redirect_to topics_url
    end
  end
end
