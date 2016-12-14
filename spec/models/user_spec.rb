require 'rails_helper'

describe User do

  let(:user){build(:user)}
  let(:bad_password){build(:user, password: 'pass')}
  # let(:short_name){build(:user, name: 'j')}
  let(:bad_email){build(:user, email: user.email)}
  let(:created_user){create(:user)}

  it "creats a user" do
    expect(user).to be_valid #happy
  end

  it "has a validates password length" do
    expect(bad_password).to_not be_valid #sad
  end

  it "is associated with a profile" do
    expect(User.reflect_on_association(:profile).macro).to eq(:has_one) #happy
  end

  it { should have_one(:profile) }
  it { should have_secure_password }
  it { should have_many(:posts)}
  it { should have_many(:likes)}
  it { should have_many(:liked_posts)}
  it { should have_many(:comments)}
  it { should validate_uniqueness_of(:email) }
  xit { should have_many(:frined_users)}
  it { should have_many(:friends)}


  it "skips password validation if nil on update" do
    user.save
    user.update_attributes(email: "merf@derf.org") #happy
    expect(user.email).to eq("merf@derf.org") #happy
  end



  describe '#generate_token' do

    it "generates an auth token on creation" do
      expect(user.auth_token).to be_nil
      new_user = User.create(email:"foo@bar.com", password: "foobar123")
      expect(created_user.auth_token).to_not be_nil
    end


    xit "does not allow manual auth token set" do
      expect(user.auth_token).to be_nil
      user.auth_token = "ZNZy5VGn12_aAyotbmsicQ"
      expect(user.auth_token).to be_nil
    end

  end

  describe '#regenerate_auth_token' do

    it "regenerates an auth token" do
      first_token = created_user.auth_token
      created_user.regenerate_auth_token
      expect(created_user.auth_token).to_not eq(first_token)
    end

  end

  describe '#format_input' do

    it "downcases email" do
      user.update_attributes(email: "mErF@Derf.COM")
      expect(user.email).to eq("merf@derf.com")
    end

  end

end
