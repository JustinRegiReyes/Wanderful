class SessionsController < ApplicationController

   def new
      @user = User.new
      render :new
   end

   def create
      @user = User.find_by(params[:email])
      #@user.confirm(params[:password])
      if @user
         login(@user)
         redirect_to "/users/#{@user.id}"
      else
         redirect_to "/users/new"
      end
   end

   def destroy
   end

end
