require 'rails_helper'

describe Post do

  it { should belong_to(:user) }
  it { should have_many(:likes)}
  it { should have_many(:user_likes)}
  it { validate_presence_of(:first_name)}
  it { validate_presence_of(:last_name)}
end
