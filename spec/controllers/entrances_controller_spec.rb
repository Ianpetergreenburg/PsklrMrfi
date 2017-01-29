require 'rails_helper'

describe EntrancesController do
  describe 'GET #home' do

    it 'responds with status code 200' do
      get :home
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      get :home
      expect(response).to render_template('home')
    end
  end

    describe 'GET #home2' do

    it 'responds with status code 200' do
      get :home2
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      get :home2
      expect(response).to render_template('home2')
    end
  end

    describe 'GET #tina' do

    it 'responds with status code 200' do
      get :tina
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      get :tina
      expect(response).to render_template('tina')
    end
  end

    describe 'GET #login_tina' do

    it 'responds with status code 200' do
      get :login_tina
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      get :login_tina
      expect(response).to render_template('login_tina')
    end
  end
end
