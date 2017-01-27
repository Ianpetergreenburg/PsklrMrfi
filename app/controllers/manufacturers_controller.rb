class ManufacturersController < ApplicationController
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
