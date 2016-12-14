require 'rails_helper'

feature 'User#new' do  #'Users can sign up'

  it "adds a new user on valid signup" do
    expect { create_user }.to change{ User.count }.by(1)
  end

end
