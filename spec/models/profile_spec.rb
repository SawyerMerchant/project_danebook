require 'rails_helper'

describe Profile do

  it { should belong_to(:user) }
  it { validate_presence_of(:first_name)}
  it { validate_presence_of(:last_name)}
end
