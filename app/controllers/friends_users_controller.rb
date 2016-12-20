class FriendsUsersController < ApplicationController
  # before_action :require_current_user, only: [:create, :destroy]

  def create
    new_friend = User.find(params[:user_id])
    current_user.friends << new_friend
    new_friend.friends << current_user
    redirect_to user_path(new_friend)
  end

  def destroy
    old_friend = User.find(params[:user_id])
    current_user.friends.delete(old_friend)
    old_friend.friends.delete(current_user)
    redirect_to user_path(old_friend)
  end

  def index
    @user = User.find(params[:user_id])
    @friends = @user.friends
  end

end
