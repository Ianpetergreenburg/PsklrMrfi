class UsersController < ApplicationController
  before_action :current_user_commissioner

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You are now a member!"
      log_in(@user)
      redirect_to robots_path # page for shopping
    else
      flash[:error] = "You must give the correct information to continue!"
      render "new"
    end
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Changes saved!"
      redirect_to robots_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :payment_info)
    end
end
