class PhotosController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  # before_action :require_current_user, only: [:new, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end

  def show
  end

  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "You added a photo"
      redirect_to user_photos_path(current_user)
    else
      flash.now[:error] = "Photo faild to save"
      render user_photos_path(current_user)
    end
  end

  def update
  end

  private

    def photo_params
      params.require(:photo).permit(:photo_file)

    end

end
