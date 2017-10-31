class SessionsController < ApplicationController
  def new  # get '/login'
    @user = User.new
  end

  def create # post '/login'
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # log_in @user # in sessions_helper
      session[:user_id] = @user.id
      redirect_to root_url
      # redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def destroy # get '/logout'
    session.delete(:user_id)
    redirect_to questions_path
  end
end
