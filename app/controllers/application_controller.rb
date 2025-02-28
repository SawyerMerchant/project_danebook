class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :require_login

  private

    def set_user
      @user = User.find(params[:id])
    end

    def sign_in(user)
      user.regenerate_auth_token
      cookies[:auth_token] = user.auth_token
      @current_user = user
    end

    def permanent_sign_in(user)
      user.regenerate_auth_token
      cookies.permanent[:auth_token] = user.auth_token
      @current_user = user
    end

    def sign_out
      @current_user = nil
      cookies.delete(:auth_token)
      redirect_to new_user_path
    end

    def current_user
      if cookies[:auth_token]
        @current_user = User.find_by_auth_token(cookies[:auth_token])
      end
    end
    helper_method :current_user

    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?

    def require_login
      unless signed_in_user?
        flash[:error] = "Unauthorized user."
        redirect_to login_path
      end
    end

    def require_current_user
      unless params[:id] == current_user.id.to_s
        flash[:error] = "You're not authorized to view this!"
        redirect_to(:back)
      end
    end

    def confirm_current_user
      unless params[:user_id] == current_user.id.to_s
        flash[:error] = "You're not authorized to view this!"
        redirect_to root_path
      end
    end

end
