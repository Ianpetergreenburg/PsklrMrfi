class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
    render "new"
  end

  def create
    user = User.find_by(username: params_username)
    if user && user.authenticate(params_password)
      log_in(user)
      if current_user_commissioner
        redirect_to robots_path
      else
        # redirect_to user home page
      end
    else
      flash[:notice] = "You must be logged in with proper credentials"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end

  private
  def params_username
    params[:session][:username]
  end

  def params_password
    params[:session][:password]
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
