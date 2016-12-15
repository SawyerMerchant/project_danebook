require 'rails_helper'

describe PostsController do
  describe 'post management' do
    let(:user_post){ create :post }
    let(:user){ user_post.user }
    let(:another_post){ create(:post, user: user) }

    before :each do

      cookies[:auth_token] = user.auth_token
    end


    describe 'GET #index' do
      it "grabs the user's posts" do
        # another_post = create(:post, author)
        get :index, params: {user_id: user.id}
        expect(assigns(:posts)).to match_array [another_post, user_post]
      end
    end

    it "renders the :index template" do
      get :index, params: {user_id: user.id}
      expect(response).to render_template :index
      expect(response).to have_http_status(200)
    end

    context 'with valid params' do

      describe "POST #create" do
        it "redirects to the post index" do
          post :create, params: { post: attributes_for(:post) }
          expect(response).to redirect_to user_posts_path(user.id)
          expect(response).to have_http_status(302)
        end

        it "creates a post" do
          expect{
            post :create, params: { post: attributes_for(:post) }
          }.to change(Post, :count).by(1)
        end
      end
    end

    context 'with invalid params' do

      # it "fails to create a post" do
      #   expect{
      #     post :create, params: {post: attributes_for(:post, body: "")}
      #   }.to_not change(Post, :count)
      # end
    end

  end
end
