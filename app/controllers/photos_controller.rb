class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  before_action :authenticate_user!  
  def index
    @photos = Photo.all.order(id: :desc)
  end
  def new
    @photo = current_user.photos.build
  end
  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "Your post has been created!"
      redirect_to photos_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
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
