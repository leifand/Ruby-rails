class DisplaysController < ApplicationController
  def index
    session[:views] ||= 0
  end

  def result
    @result = session[:result]
  end

  def process_survey
      session[:views] += 1
      session[:result] = params[:survey]
      flash[:success] = "You have submitted this form #{ session[:views] } time(s) now."
      redirect_to '/surveys/result'
  end

end
