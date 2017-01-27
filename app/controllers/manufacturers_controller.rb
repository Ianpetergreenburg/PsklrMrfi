class ManufacturersController < ApplicationController
  
  def index
    
  end


  def show
    @manufacturer = Manufacturer.find(params[:id])
    respond_to do |format|
      format.html { render 'show'}
      format.js
    end
  end

end
