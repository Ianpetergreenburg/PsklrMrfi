require 'rails_helper'

describe UsersController, type: :controller do

  let (:user_details) { { user: attributes_for(:user) } }
  let (:bad_details) { { user: { username: 'nothing' } } }

  describe "users#create" do
    context "when user provides proper credentials" do

      it "directs created users to robots index" do
        get :create, params: user_details
        expect(response).to redirect_to robots_path
      end

      it "logs in the user" do
        get :create, params: user_details
        expect(session[:user_id]).to_not be_nil
      end

      it 'assigns @user to a user with the given details' do
        get :create, params: user_details
        expect(assigns(:user).username).to eq user_details[:user][:username]
      end
    end

    context "when user provides improper credentials" do
      it "rerenders the new page for noncreated users" do
        get :create, params: bad_details
        expect(response).to render_template(:new)
      end

      it "doesn't log in the user" do
        get :create, params: bad_details
        expect(session[:user_id]).to be_nil
      end

      it 'assigns @user to a user with the given details' do
        get :create, params: bad_details
        expect(assigns(:user).username).to eq bad_details[:user][:username]
      end
    end
  end

  describe "users#new" do

    it 'responds with status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'assigns the user as @user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "users#edit" do
    let(:user) { create(:user) }
    xcontext 'user is logged in' do


      before :each do
        request.session[:user_id] = user.id
      end

      it 'responds with status code 200' do
        get :edit, params: { id: user.id }
        expect(response).to have_http_status 200
      end

      it 'assigns the user as @user' do
        get :edit, params: { id: user.id }
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit template' do
        get :edit, params: { id: user.id }
        expect(response).to render_template('edit')
      end
    end

    context 'user isn\'t logged in' do

      it 'responds with status code 302' do
        get :edit, params: { id: user.id }
        expect(response).to have_http_status 302
      end

      it 'redirects to home page' do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to '/'
      end
    end
  end
end
