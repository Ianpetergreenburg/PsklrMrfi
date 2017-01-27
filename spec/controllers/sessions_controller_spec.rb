require 'rails_helper'

describe SessionsController do
  describe 'sessions#create' do
    let :user do
      FactoryGirl.create(:user)
    end

    let :credentials do
      { session: {username: user.username, password: 'password'} }
    end

    before :each do
    end

    it "creates a user session" do
      post :create, params: credentials
      expect(session[:id]).to eq user.id
    end
  end

  describe "#destroy" do
    context "when user logged in" do
      before :each do
        get :destroy
      end

      it "destroys user session" do
        session[:user_id].should be_nil
      end
    end
  end
end
