require 'rails_helper'

describe RobotsController do
  let!(:robot) { create(:robot) }

  describe 'GET #index' do
    it 'responds with status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'assigns the robots as @robots' do
      get :index
      expect(assigns(:robots)).to eq(Robot.all)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @robots to the given robot' do
      get :show, params: {id: robot.id}
      expect(assigns(:robot)).to eq robot
    end
  end
end

