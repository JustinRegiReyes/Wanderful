class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def edit
 
    id = params[:id]
    @user = User.find_by_id(id)
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)

    redirect_to "/users"
  end

  def update
    
    user_id = params[:id]
    user = User.find_by_id(user_id)

    updated_attributes = params.require(:user).permit(:first_name, :last_name, :username)
    user.update_attributes(updated_attributes)
    redirect_to "/users/#{user_id}"
  end

  def destroy
  end

  def new
    @user = User.new
  end
end
