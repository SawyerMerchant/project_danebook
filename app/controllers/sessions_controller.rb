class SessionsController < ApplicationController

  skip_before_action :require_login, :only => [:new, :create]

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      if params[:session][:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end

      flash[:success] = "You've successfully signed in."
      redirect_to @user
    else
      flash[:error] = "We couldn't sign you in."
      redirect_to root_path
    end
  end

end
