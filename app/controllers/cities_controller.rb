class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new

  end

  def create
  end

  def show
    @city = City.find_by_name
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
