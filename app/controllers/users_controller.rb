class UsersController < ApplicationController

  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  skip_before_action :require_login, :only => [:new, :create]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
    @user.profile = Profile.new
    @home_page = true
  end

# TODO extract password checking out into own class
# https://www.viget.com/articles/slimming-down-your-models-and-controllers
# extract login
  def create
    @user = User.new(user_params)
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

  def update
    if current_user.update(user_params)
      flash[:success] = "You updated your profile"
      redirect_to @user
    else
      puts "PROFILE ERROR"
      flash.now[:error] = "Could not update your profile"
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def show
    #about
  end

  def edit
    # @profile = @user.profile
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
          :gender,
          :words,
          :about,
          :telephone,
          :college,
          :currentlylives,
          :hometown]
        )
    end

    # def profile_params
    #   params.require(:profile).permit(
    #     :first_name,
    #     :last_name,
    #     :birthday,
    #     :gender
    #     )
    # end

    # eager loading w/ includes

    def set_user
      @user = User.find(params[:id])
    end

end
