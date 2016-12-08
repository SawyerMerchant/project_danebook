class UsersController < ApplicationController

  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  skip_before_action :require_login, :only => [:new, :create]

  def new
    @user = User.new
    @home_page = true
  end

  def create
    @user = User.new(strong_params)
    @user.email.downcase!
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      flash.now[:error] = "Could not create a new user."
      render :new
    end
  end

  private

    def strong_params
      params.require(:user).permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :password_confirmation,
          :birthday,
          :gender
        )
    end

    def set_user
      @user = User.find(params[:id])
    end

end
