require 'rails_helper'

describe RobotsController do
  let!(:robot) { create(:robot) }

  describe 'GET #index_customer when average user is logged in' do
    before :each do
      create(:robot)
      user = create(:user)
      credentials = {session: {username: user.username, password: 'hello'}}
      request.session[:user_id] = user.id
    end


    it 'responds with status code 302' do
      get :index
      expect(response).to have_http_status 302
    end

    it 'redirects to index_customer' do
      get :index
      expect(response).to redirect_to :index_customer
    end


    it 'renders the :index template' do
      get :index_customer
      expect(response).to render_template('index_customer')
    end

    it 'assigns @robots to the given robot' do
      get :show, params: {id: robot.id}
      expect(assigns(:robot)).to eq robot
    end
  end

  describe 'GET #index when the commish is logged in' do
    before :each do
      create(:robot)
      the_commish = create(:admin)
      credentials = {session: {username: the_commish.username, password: "mutantkiller"}}
      get :index
      request.session[:user_id] = the_commish.id
    end

    it 'assigns the robots as @robots' do
      get :index
      expect(assigns(:robots)).to eq(Robot.all)
    end

    it 'assigns the manufacturers as @manufacturers' do
      get :index
      expect(assigns(:manufacturers)).to eq(Manufacturer.all)
    end

  end
end
