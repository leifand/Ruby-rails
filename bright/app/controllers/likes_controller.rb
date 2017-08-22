class LikesController < ApplicationController
  def create
    p "CREATE LIKE"
    @idea = Idea.find(params[:id])
    Like.create(user:current_user, idea:@idea)
    redirect_to '/ideas'
  end
end
