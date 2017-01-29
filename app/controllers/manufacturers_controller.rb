class ManufacturersController < ApplicationController

  def index

  end


  def show
    if logged_in?
      @manufacturer = Manufacturer.find(params[:id])
      if current_user_commissioner
      else
        respond_to do |format|
          format.html { render '_show', layout: false}
          format.js
        end
      end
    else
      redirect_to '/'
    end
  end

end
