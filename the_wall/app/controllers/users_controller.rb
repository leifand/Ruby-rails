class UsersController < ApplicationController
  def new

  end
  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = ["SUCCESS!!!"]
      session[:user_id] = @user.id
      return redirect_to "/messages"
    end
    flash[:errors] = @user.errors.full_messages
    #flash[:notice] = ["Input some shit in the form you fucking dumbass!!!"]
    return redirect_to :back
  end
  private def user_params
    params.require(:user).permit(:username)
  end
end
