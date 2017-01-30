class UsersController < ApplicationController
  before_action :current_user_commissioner

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:success] = "You are now a member!"
      redirect_to robots_path # page for shopping
    else
      flash[:danger] = "You must give the correct information to continue!"
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
    if logged_in?
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:notice] = "Changes saved!"
        redirect_to robots_path
      else
        render 'edit'
      end
    else
      redirect_to '/'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :payment_info)
    end
end
