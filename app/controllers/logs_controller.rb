class LogsController < ApplicationController

   def new
      @log = Log.new
   end

   def create
   end

   def destroy
   end

   def show
   	
   	@log = Log.find(params[:id])
   end

end
