require 'rails_helper'

describe ManufacturersController do
  let!(:manufacturer) { create(:manufacturer) }
  describe 'GET #index' do
    it 'responds with status code 200' do
      get :show, params: {id: manufacturer.id}
      expect(response).to have_http_status 200
    end

    it 'assigns the manufacturers as @manufacturers' do
      get :show, params: {id: manufacturer.id}
      expect(assigns(:manufacturer)).to eq(manufacturer)
    end

    it 'renders the :index template' do
      get :show, params: {id: manufacturer.id}
      expect(response).to render_template(:show)
    end
  end
end
