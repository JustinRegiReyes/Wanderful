class SessionsController < ApplicationController

   def new
      @user = User.new
      render :new
   end

   def create # login
      # binding.pry
      @user = User.find_by_email(params[:user][:email])
      if @user
         login(@user)
         redirect_to profile_path(@user.id)
      else
         redirect_to "/users/new"
      end
   end

   def destroy
      # binding.pry
      logout
      redirect_to root_path
   end

end
