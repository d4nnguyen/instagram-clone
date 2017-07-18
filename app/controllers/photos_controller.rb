class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]  
  def index
    @photos = Photo.all.order(id: :desc)
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.create(photo_params)
    flash[:success] = "Your photo has been created!"
    redirect_to photos_path 
  end
  def show
  end

  private
  def photo_params  
    params.require(:photo).permit(:image)
  end
  def set_photo
    @photo = Photo.find(params[:id])
  end
end
