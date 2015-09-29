class LogsController < ApplicationController
   # attr_accessor :city_id
   def new

      # city_url = request.original_url
      # city_arr = city_url.split("/")
      # city_id = city_arr[4]
      # puts "\n\n\n\n\n\n\n #{city_id}"
      # binding.pry
      @user = current_user
      @log = Log.new
      @city = City.find_by_id(params[:id])
   end

   def index
      @logs = Log.all
   end

   def create
      # binding.pry

      logInfo = params.require(:log).permit(:title, :content)
      city = City.find_by_id(params[:id])
      # city = City.find_by_name(cityName)
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

      @authors = User.all
      author_id = @log.user_id
      @author = @authors.find(author_id)

   end

end
