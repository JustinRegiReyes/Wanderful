class LogsController < ApplicationController

   def new
      @user = current_user
      @log = Log.new
   end

   def index
      @logs = Log.all
   end

   def create
      logInfo = params.require(:log).permit(:title, :content)
      cityName = params[:log][:city]
      city = City.find_by_name(cityName)
      user = current_user
      log = Log.create(logInfo)
      city.logs << log
      user.logs << log
      redirect_to "/cities/#{city.id}"
   end

   def edit
      id = params[:id]
    @log = Log.find_by_id(id)
    @city = City.find_by_id(@log.city_id)

   end

   def update
    log_id = params[:id]
    log = Log.find_by_id(log_id)

    updated_attributes = params.require(:log).permit(:title, :content)
    log.update_attributes(updated_attributes)
    redirect_to "/logs/#{log_id}"

   end

   def destroy
   end

   def show

   	@current_user = current_user
      @user = current_user
   	@log = Log.find(params[:id])

      @authors = User.all
      author_id = @log.user_id
      @author = @authors.find(author_id)

   end

end
