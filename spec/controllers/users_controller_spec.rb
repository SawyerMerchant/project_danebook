require 'rails_helper'

describe UsersController do
  describe 'user access' do
    let(:user){ create(:user) }

    before :each do
      cookies[:auth_token] = user.auth_token
    end

    describe 'GET #index' do
      it "all users returned by @users" do
        another_user = create(:user)
        get :index
        expect(assigns(:users)).to match_array [user, another_user]
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
        expect(response).to have_http_status(200) #logged in, but not signin
      end
    end

    it "GET #new renders new template" do
      get :new
      expect(response).to render_template :new
      expect(response).to have_http_status(200)
    end

    context 'with valid params' do

      describe "POST #create" do
        it "redirects to the new user" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to user_path(assigns(:user))
          expect(response).to have_http_status(302)
        end

        it "creates the user" do
          expect{
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end
      end
    end

    context 'with invalid params' do

      it "fails to create the user" do
        expect{
          post :create, user: attributes_for(:user, email: "")
        }.to_not change(User, :count)
      end
    end

    describe "GET #edit" do
      it "users can edit their own profile" do
        get :edit, id: user.id
        expect(response).to render_template :edit
        expect(response).to have_http_status(200)
      end

      it "blocks editing others profiles" do
        # make sure this user actually exists
        another_user = create(:user)
        get :edit, id: another_user.id

        expect(response).to redirect_to root_url
        expect(response).to have_http_status(302)
      end
    end

    describe "PATCH #update" do

      before { user }

      context "with valid attributes" do

        let(:updated_email){ "new@foo.org" }

        it "finds the specified user" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: updated_email)
          expect(assigns(:user)).to eq(user)
        end

        it "redirects to the updated user" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: updated_email)

          expect(response).to redirect_to user_path(assigns(:user))
          expect(response).to have_http_status(302)
        end

        it "actually updates the user" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: updated_email)
          user.reload
          expect(user.email).to eq(updated_email)
        end
      end

      context "with invalid attributes" do

        let(:fail_email){ "" }

        it "finds the specified user" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: fail_email)
          expect(assigns(:user)).to eq(user)
        end

        it "redirects back to the edit user path" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: fail_email)

          # expect(response).to render_template edit_user_path(assigns(:user))
          expect(response).to have_http_status(200)
        end

        it "fails to update the user" do
          put :update, id: user.id,
                       user: attributes_for(:user,
                                             email: fail_email)
          user.reload
          expect(user.email).to_not eq(fail_email)
        end
      end
    end

    describe "DELETE #destroy" do

      before { user }

      context "with valid attributes" do

        it "destroys the user" do
          expect{
            delete :destroy, id: user.id
          }.to change(User, :count).by(-1)
        end

        it "redirects to the root" do
          delete :destroy, id: user.id
          expect(response).to redirect_to root_url
          expect(response).to have_http_status(302)
        end

      end

      context "with invalid attributes" do

        it "destroys the user" do
          expect{
            delete :destroy, id: user.id
          }.to change(User, :count).by(-1)
        end

        it "redirects to the root" do
          delete :destroy, id: user.id
          expect(response).to redirect_to root_url
          expect(response).to have_http_status(302)
        end

      end
    end
  end
end
