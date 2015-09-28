#sharon is here, correctly this time!!
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
  end
end


# Where will this go when I push to github
#this is sarad