class UsersController < ApplicationController

  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  skip_before_action :require_login, :only => [:new, :create]

  def new
    @user = User.new
    @home_page = true
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    # @profile = @user.create_profile(profile_params)

    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      flash.now[:error] = "Could not create a new user."
      render :new
    end
  end

  def show

  end

  def edit
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :profile_attributes =>
        [:id,
        :first_name,
        :last_name,
        :birthday,
        :gender]
        )
    end

    def profile_params
      params.require(:profile).permit(
        :first_name,
        :last_name,
        :birthday,
        :gender
        )
    end

    def set_user
      @user = User.find(params[:id])
    end

end
