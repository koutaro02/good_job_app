class MapsController < ApplicationController

  def index
    
  end
  
  def new
    @map = Map.new
    @maps = Map.all
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def map_params
    params.require(:map).permit(:title, :address, :latitude, :longitude, :content, :image, user_ids: [])
  end
end
