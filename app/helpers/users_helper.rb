module UsersHelper

  def edit_or_friend_link
    if @user == current_user
      text = link_to 'Edit Profile', edit_user_path(@user), class: 'btn btn-link', role: 'button'
      text.html_safe
    else
      if current_user.friends.include?(@user)
        link_to 'Unfriend Me', friends_users_path(user_id: @user.id), method: :delete, class: 'btn btn-link', role: 'button'
      else
        link_to 'Add Friend', friends_users_path(user_id: @user.id), method: :post, class: 'btn btn-link', role: 'button'
      end
    end

  end

  def user_full_name
    @user.profile.first_name + ' ' + @user.profile.last_name
  end
end
