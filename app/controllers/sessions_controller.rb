class SessionsController < ApplicationController

   def new
      @user = User.new
      render :new
   end

   def create # login
      userParams = params.require(:user).permit(:email, :password)
      @user = User.confirm(userParams)
      if @user
         login(@user)
         redirect_to profile_path(@user.id)
      else
         redirect_to "/sessions/new"
      end
   end

   def destroy
      # binding.pry
      logout
      redirect_to root_path
   end

end
