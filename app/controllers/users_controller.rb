class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def edit
 
    id = params[:id]
    @user = User.find_by_id(id)
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :username)
    @user = User.create(user_params)

    redirect_to "/users/#{@user.id}"
  end

  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)

    updated_attributes = params.require(:user).permit(:first_name, :last_name, :username, :current_city)
    user.update_attributes(updated_attributes)
    redirect_to "/users/#{user_id}"
  end

  def destroy
  end

  def new
    @user = User.new
    # @current_user = current_user
  end
end
