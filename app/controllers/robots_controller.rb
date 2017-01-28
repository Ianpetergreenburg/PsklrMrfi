class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      if current_user_commissioner
        @robots = Robot.all
        @manufacturers = Manufacturer.all
      else
        redirect_to index_customer_path
      end
    else
      redirect_to '/'
    end
  end

  def index_customer
  end

  def new
    if logged_in?
      @robot = Robot.new
    else
      redirect_to '/'
    end
  end

  def create
    @robot = Robot.create(robot_params)
    redirect_to robots_path
  end

  def show
    respond_to do |format|
      format.html { render '_show' }
      format.js
    end
  end

  def edit
  end

  def update
    @robot.update(robot_params)
    redirect_to robot_path(@robot)
  end

  def destroy
    @robot.destroy
    redirect_to robots_path
  end


  private

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def robot_params
    params.require(:robot).permit(:designation, :height, :weight, :model_no, :pending, :manufacturer_id)
  end

end
