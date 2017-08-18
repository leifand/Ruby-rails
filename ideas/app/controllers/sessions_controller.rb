class SessionsController < ApplicationController
  def index
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created, please log in"
      return redirect_to '/sessions/new'
    else
      flash[:errors] = @user.errors.full_messages
      return redirect_to '/users/new'
    end
  end
  def destroy
  end
  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
