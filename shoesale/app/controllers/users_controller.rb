class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  before_filter(only: [:show, :edit, :update, :destroy]) { require_correct_user }

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
          flash[:notice] = ["Registered successfully"]
          session[:user_id] = @user.id
          return redirect_to '/shoes'
      end
      errors = @user.errors.full_messages
      flash[:errors] = errors
      return redirect_to :back
    end

    private def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
    end

    private def require_correct_user
      unless params[:id].to_i == session[:user_id]
        return redirect_to "/users/#{session[:user_id]}"
      end
    end
end
