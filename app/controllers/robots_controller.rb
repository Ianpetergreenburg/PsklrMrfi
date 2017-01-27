class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :edit, :update, :destroy]

  def index
    @robots = Robot.all
    @manufacturers = Manufacturer.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.create(robot_params)
    redirect_to robots_path
  end

  def show
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
    params.require(:robot).permit(:designation, :height, :weight, :model_no, :pending)
  end

end
