class UsersController < ApplicationController
  before_filter :current_user_commissioner

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
      redirect_to 'new'
    end
  end

  #option to edit info or delete

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :payment_info)
    end
end
