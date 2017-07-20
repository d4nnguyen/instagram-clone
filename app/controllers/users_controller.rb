class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user_name = @user.user_name
    @user_photos = @user.photos
  end


  private
  def set_user
    @user = User.find(params[:id])
  end
end
