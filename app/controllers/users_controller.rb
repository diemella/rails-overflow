class UsersController < ApplicationController
  def show  # get '/users/profile'
    @user = User.find(params[:id])
  end

  def new  # get '/users/register'
    @user = User.new
  end

  def create # post '/users/register'
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit # get '/users/:id/edit'
    @user = User.find(params[:id])
  end

  def update # put '/users/:id'
   @user = User.find(params[:id])

    if @user.update(user: params[:user][:user], user_id: session[:user_id])
      # redirect_to user_path(@user) # redirect "/users/#{@user.id}"
      redirect_to root_url
    else
      render 'edit' # erb :'/users/edit'
    end
  end

  def destroy # delete '/users/:id'
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


# SINATRA User Controller

# get "/user/register" do
#   erb :register
# end

# post "/user/register" do
#   @user = User.new(params)
#   if @user.valid?
#     @user.save
#     redirect "/user/login"
#   else
#     @error = "Invalid name or email"
#     erb :register
#   end
# end

# get "/user/login" do
#   erb :login
# end

# post "/user/login" do
#   @user = User.find_by(email: params[:email])
#   if @user.password == params[:password]
#     session[:user_id] = @user.id
#     redirect "/questions"
#   else
#     @error = "Incorrect email or password"
#     erb :login
#   end
# end

# get "/user/logout" do
#   session[:user_id] = nil
#   redirect "/questions"
# end
