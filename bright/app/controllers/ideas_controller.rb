class IdeasController < ApplicationController
  def index
    @best_ideas = Idea.all
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
  private def idea_params
    params.require(:idea).permit(:content).merge(user: current_user)
  end
end
