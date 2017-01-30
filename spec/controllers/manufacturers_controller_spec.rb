require 'rails_helper'

describe ManufacturersController do
  let!(:manufacturer) { create(:manufacturer) }

  describe 'GET #show when the average user is logged in' do

    before :each do
      user = create(:user)
      request.session[:user_id] = user.id
    end

    it 'responds with status code 200' do
      get :show, params: {id: manufacturer.id}
      expect(response).to have_http_status 200
    end

    it 'assigns the manufacturers as @manufacturers' do
      get :show, params: {id: manufacturer.id}
      expect(assigns(:manufacturer)).to eq(manufacturer)
    end

    it 'renders the :show template' do
      get :show, params: {id: manufacturer.id}
      expect(response).to render_template('_show')
    end
  end

  describe 'GET #show when admin is logged in' do

    before :each do
      user = create(:admin)
      request.session[:user_id] = user.id
    end

    it 'responds with status code 200' do
      get :show, params: {id: manufacturer.id}
      expect(response).to have_http_status 200
    end

    it 'assigns the manufacturers as @manufacturers' do
      get :show, params: {id: manufacturer.id}
      expect(assigns(:manufacturer)).to eq(manufacturer)
    end

    it 'renders the :show template' do
      get :show, params: {id: manufacturer.id}
      expect(response).to render_template('show')
    end
  end

  describe 'GET #show when no user is logged in' do
    it 'responds with status code 302' do
      get :show, params: {id: manufacturer.id}
      expect(response).to have_http_status 302
    end

    it 'redirects to home page' do
      get :show, params: {id: manufacturer.id}
      expect(response).to redirect_to '/'
    end
  end

end
