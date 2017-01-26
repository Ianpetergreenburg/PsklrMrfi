class SessionsController < ApplicationController

def new
 @user = User.new
  render "new"
end

def create
  user = User.find_by(username: params[:session][:username].downcase)
  if user && user.authenticate(params[:session][:password])
    render  action: 'robots#show'
  else
    flash[:notice] = "You must be logged in with proper credentials"
    render 'new'
  end
end


end
