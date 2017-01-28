class ManufacturersController < ApplicationController

  def index

  end


  def show
    @manufacturer = Manufacturer.find(params[:id])
    respond_to do |format|
      format.html { render '_show', layout: false}
      format.js
    end
  end

end
