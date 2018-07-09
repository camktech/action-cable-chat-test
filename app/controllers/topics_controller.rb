class TopicsController < ApplicationController
  require 'pry'
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(name: topic_params[:name])
    redirect_to @topic
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    if @topic.nil?
      redirect_to topics_url
    end
  end
  private

    def topic_params
      params.require(:topic).permit(:name)
    end
end
