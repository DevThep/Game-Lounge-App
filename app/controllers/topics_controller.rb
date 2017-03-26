class TopicsController < ApplicationController
  before_action :logged_in_user
  
  def show
  end

  def create
  	@topic = Topic.new(topic_params)
	if @topic.save
		flash[:success] = "New Topic Added!"
		redirect_to @topic.game
	else
		flash[:danger] = "Topic field empty"
		redirect_to @topic.game
	end
  end

  def destroy
  	@topic = Topic.find(params[:id])
  	@game = Game.find(@topic.game_id)
  	@topic.destroy
  	flash[:success] = "Topic removed"
  	redirect_to @game
  end

  private
  	def topic_params
  		params.require(:topic).permit(:name,:game_id)
  	end
end
