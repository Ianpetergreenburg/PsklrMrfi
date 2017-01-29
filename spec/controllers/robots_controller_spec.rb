require 'rails_helper'

describe RobotsController do
  let!(:manufacturer) { create(:manufacturer) }
  let!(:robot) { create(:robot) }

  context 'GET #index' do
    describe 'GET #index when average user is logged in' do
      before :each do
        create(:robot)
        user = create(:user)
        credentials = {session: {username: user.username, password: 'hello'}}
        get :index
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


      it 'renders the :index_customer template' do
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
        the_commish = create(:admin)
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

      it 'renders the :index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #index when not logged in' do
      it 'redirects back to the root path' do
        get :index
        expect(response).to redirect_to '/'
      end

      it 'responds with status code 302' do
        get :index
        expect(response).to have_http_status 302
      end
    end
  end

  context 'GET #show' do
    it 'assigns @robot to a robot' do
      get :show, params: {id: robot.id}
      expect(assigns(:robot)).to eq robot
    end

    it 'responds with status code 200' do
      get :show, params: {id: robot.id}
      expect(response).to have_http_status 200
    end

    it 'renders the :_show template' do
      get :show, params: {id: robot.id}
      expect(response).to render_template('_show')
    end

  end

  context 'GET #edit' do
    it 'assigns @robot to a robot' do
      get :edit, params: {id: robot.id}
      expect(assigns(:robot)).to eq robot
    end

    it 'responds with status code 200' do
      get :edit, params: {id: robot.id}
      expect(response).to have_http_status 200
    end

    it 'renders the :edit template' do
      get :edit, params: {id: robot.id}
      expect(response).to render_template('edit')
    end
  end

  context 'DELETE #destroy' do
    before :each do
      user = create(:user)
      request.session[:user_id] = user.id
    end
    it 'assigns @robot to a robot' do
      delete :destroy, params: {id: robot.id}
      expect(assigns(:robot)).to eq robot
    end

    it 'responds with status code 302' do
      delete :destroy, params: {id: robot.id}
      expect(response).to have_http_status 302
    end

    it 'redirects to index page' do
      delete :destroy, params: {id: robot.id}
      expect(response).to redirect_to robots_path
    end

    it 'deletes the given robot from the system' do
      expect{delete :destroy, params: {id: robot.id}}.to change{Robot.count}.from(1).to(0)
    end
  end

  context 'PUT #update' do
    it 'assigns @robot to a robot' do
      put :update, params: {id: robot.id, robot: {designation: 'Brobot'}}
      expect(assigns(:robot)).to eq robot
    end

    it 'responds with status code 302' do
      put :update, params: {id: robot.id, robot: {designation: 'Brobot'}}
      expect(response).to have_http_status 302
    end

    it 'redirects to robots show page' do
      put :update, params: {id: robot.id, robot: {designation: 'Brobot'}}
      expect(response).to redirect_to robot_path(robot)
    end

    it 'updates the given robot in the system' do
      put :update, params: {id: robot.id, robot: {designation: 'Party Bot'}}
      expect(assigns(:robot).designation).to eq 'Party Bot'
    end
  end

  context 'POST #create' do
    before :each do
      @attributes = attributes_for(:robot)
      @attributes[:manufacturer_id] = manufacturer.id
    end

    it 'assigns @robot to a robot' do
      post :create, params: {robot: @attributes}
      expect(assigns(:robot).designation).to eq robot.designation
    end

    it 'responds with status code 302' do
      post :create, params: {robot: @attributes}
      expect(response).to have_http_status 302
    end

    it 'redirects to robots show page' do
      post :create, params: {robot: @attributes}
      expect(response).to redirect_to robots_path
    end

    it 'creates the robot in the system' do
      expect{post :create, params: {robot: @attributes}}.to change{Robot.count}.from(1).to(2)
    end
  end

end
