require 'rails_helper'

describe PrototypesController do
  describe 'prototypes#show' do
    let(:manufacturer) {create(:manufacturer) }
    let(:prototype) { create(:prototype, manufacturer: manufacturer) }

    context 'admin is logged in' do
      let(:user) { create(:admin) }

      before :each do
        request.session[:user_id] = user.id
      end

      it 'assigns @prototype to the given prototype' do
        get :show, params: {id: prototype.id}
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns @manufactuer to the given manufactuer' do
        get :show, params: {id: prototype.id}
        expect(assigns(:prototype)).to eq prototype
      end

      it 'renders the show template' do
        get :show, params: {id: prototype.id}
        expect(response).to render_template(:show)
      end

      it 'responds with status code 200' do
        get :show, params: {id: prototype.id}
        expect(response).to have_http_status 200
      end
    end

    context 'regular user is logged in' do
      let(:user) { create(:user) }

      before :each do
        request.session[:user_id] = user.id
      end

      it 'redirects users to index' do
        get :show, params: {id: prototype.id}
        expect(response).to redirect_to index_customer_path
      end

      it 'responds with status code 302' do
        get :show, params: {id: prototype.id}
        expect(response).to have_http_status 302
      end

    end

    context 'no user is logged in' do

      it 'redirects users to home page' do
        get :show, params: {id: prototype.id}
        expect(response).to redirect_to '/'
      end

      it 'responds with status code 302' do
        get :show, params: {id: prototype.id}
        expect(response).to have_http_status 302
      end

    end
  end
end
