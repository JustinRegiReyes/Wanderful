class CitiesController < ApplicationController
  def index
     @cities = City.all
     @current_user = current_user
  end

  def new
    @cities = City.new
  end

  def create
  end

  def show
    id = params[:id]
    @city = City.find_by_id(id)
    @current_user = current_user
    @user = current_user
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
