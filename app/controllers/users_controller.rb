class UsersController < ApplicationController

def create
  @user = User.new(username: "the_commish", password_digest: "mutantkiller")
  if @user.save
    render
  end
end





end
