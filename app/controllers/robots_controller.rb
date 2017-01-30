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
    if !logged_in?
      redirect_to '/'
    end
  end

  def create
    @robot = Robot.create(robot_params)
    redirect_to robots_path
  end

  def show
    if current_user_commissioner
    elsif current_user
      respond_to do |format|
        format.html { render '_show' }
        format.js
      end
    else
      redirect_to '/'
    end
  end

  def edit
    if current_user_commissioner
    else
      redirect_to robots_path
    end
  end

  def update
    @robot.update(robot_params)
    redirect_to robot_path(@robot)
  end

  def destroy
    if current_user
      if !current_user_commissioner
        flash[:success] = "Check your email for your purchase confirmation"
        PurchaseMailer.purchase_email(current_user, @robot).deliver
      end
      @robot.destroy
      redirect_to robots_path
    else
      redirect_to '/'
    end
  end


  private

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def robot_params
    params.require(:robot).permit(:designation, :height, :weight, :model_no, :pending, :manufacturer_id, :price)
  end

end
