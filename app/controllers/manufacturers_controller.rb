class ManufacturersController < ApplicationController
  
  def index
    
  end


  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

end
