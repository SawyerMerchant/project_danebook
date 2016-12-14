module LoginMacros
  # u = create(user, :with_profile)

  def log_in(user)
    visit new_user_path
    # save_and_open_page
    within(".login") do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'  #'commit'
    end
  end

  def log_out
    click_link "Logout"
  end
end
