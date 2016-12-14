require 'rails_helper'


feature "Login" do
  before do

    log_in(user)
  end

  let(:profile){create :profile}
  let(:user){ profile.user }
  # let(:user){ create :user, :with_profile}

  it "allows existing users to login" do
    expect(page).to have_current_path(user_path(user))
  end

  it "allows logged in user to logout" do
    expect(page).to have_current_path(user_path(user))
    log_out
    expect(page).to have_current_path(new_user_path)
  end

  # it "updates the auth token with each login"


end
