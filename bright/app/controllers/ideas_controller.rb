class IdeasController < ApplicationController
  def index
    @best_ideas = Idea.all
    # Idea.joins(:likes).order('count(likes.id) DESC')
    # Idea.joins(:likes)
    # Idea.joins(left join likes on likes.idea_id = secrets.id').group(:id).order('count likes.id desc')
    # Idea.all.sort{|a, b| b.likes.count <=> a.likes.count}
  end
  def create
    @idea = Idea.new(idea_params)
    if @idea.save
        flash[:notice] = ["A New Idea Has Been Born!"]
        return redirect_to ideas_url
    end
    errors = @idea.errors.full_messages
    flash[:errors] = errors
    return redirect_to :back
  end
  def show
    @idea = Idea.find(params[:id])
  end
  private def idea_params
    params.require(:idea).permit(:content).merge(user: current_user)
  end
end
