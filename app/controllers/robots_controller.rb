class RobotsController < ApplicationController

  def index
    @robots = Robot.all
    @manufacturers = Manufacturer.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.create(robot_params)
  end

  def show
    @robot = Robot.find(params[:id])
  end

  def edit
    @robot = Robot.find(params[:id])
  end

  def update
    @robot = Robot.find(params[:id])
    @robot.update(params[:designation])
    redirect_to robot_path(@robot)
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy
    redirect_to robots_path
  end


  private

  def robot_params
    params.require(:robot).permit(:designation, :height, :weight, :model_no, :pending)
  end

end
