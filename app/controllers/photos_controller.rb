class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(id: :desc)
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path 
  end
  def show
    @photo = Photo.find(params[:id])
  end

  private
  def photo_params  
    params.require(:photo).permit(:image)
  end  
end
