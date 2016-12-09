class ProfileController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  skip_before_action :require_login, :only => [:new, :create]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  # def update
  #   if current_user.profile.update(user_params)
  #     flash[success] = "You updated your profile"
  #     redirect_to @user
  #   else
  #     flash.now[:error] = "Could not update your profile"
  #     render :edit
  #   end
  # end
  #
  #
  # private
  #
  # def profile_params
  #   params.require(:profile).permit(
  #     :first_name,
  #     :last_name,
  #     :birthday,
  #     :gender,
  #     :words,
  #     :college,
  #     :currentlylives,
  #     :hometown
  #     )
  # end

end
