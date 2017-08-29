class GroupsController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      Member.create(user: current_user, group: @group )
      flash[:notice] = ["You have successfully created a new group!"]
      return redirect_to :back
    end
    flash[:errors] = @group.errors.full_messages
    return redirect_to :back
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    return redirect_to :back
  end

  private def group_params
    params.require(:group).permit(:id, :name, :description).merge(user: current_user)
  end
end
