class MembersController < ApplicationController
  before_action :require_login

  def create
    @group = Group.find(params[:id])
    Member.create(user: current_user, group: @group) unless @group.users.include?(current_user)
    return redirect_to :back
  end

  def destroy
    @group = Group.find(params[:id])
    Member.find_by(group: @group, user: current_user).delete
    return redirect_to :back
  end
end
