module SignupMacros

  def create_user
    name = "Merf"
    email = "merf@aol.com"

    visit root_path
    within(".new_user") do
      fill_in "First Name", with: name
      fill_in "Last Name", with: name
      fill_in "Email", with: email
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"
      # fill_in "user_profile_attributes_birthday", with: "1/1/1990"
      click_button "Create User"
    end
  end



end
