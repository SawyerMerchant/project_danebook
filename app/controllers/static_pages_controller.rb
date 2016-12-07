class StaticPagesController < ApplicationController

  skip_before_action :require_login, :only => [:home]

  def home
    @home_page = true
    render :layout => "application"
  end

  def timeline
  end

  def friends
  end

  def about
  end

  def about_edit
  end

  def photos
  end

end
