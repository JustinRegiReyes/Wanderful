class LogsController < ApplicationController

   def new
      @user = current_user
      @log = Log.new
   end

   def create
      binding.pry
      logInfo = params.require(:log).permit(:title, :content)
      cityName = params[:log][:city]
      city = City.find_by_name(cityName)
      user = current_user
      log = Log.create(logInfo)
      city.logs << log
      user.logs << log
      redirect_to "/cities/#{city.id}"
   end

   def destroy
   end

   def show
   	@current_user = current_user
      @user = current_user
   	@log = Log.find(params[:id])
   end

end
