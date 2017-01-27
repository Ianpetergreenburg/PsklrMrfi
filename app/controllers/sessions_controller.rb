class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
    render "new"
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to  robots_path
    else
      flash[:notice] = "You must be logged in with proper credentials"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end


end
