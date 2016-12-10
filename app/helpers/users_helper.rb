module UsersHelper

  def edit_link
    if @user == current_user
      text = link_to 'Edit Profile', about_edit_path, class: 'btn btn-link', role: 'button'
      text.html_safe
    end
  end

  def user_full_name
    @user.profile.first_name + ' ' + @user.profile.last_name
  end
end
