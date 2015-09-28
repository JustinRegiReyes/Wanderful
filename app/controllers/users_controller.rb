class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)

    redirect_to "/users"
  end

  def update
  end

  def destroy
  end

  def new
    @user = User.new
    # @current_user = current_user
  end
end
