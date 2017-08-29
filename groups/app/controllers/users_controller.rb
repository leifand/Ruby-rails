class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["Registration is successful!"]
      session[:user_id] = @user.id
      return redirect_to groups_path
    end
    flash[:errors] = @user.errors.full_messages
    return redirect_to :back
  end

  private def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end
