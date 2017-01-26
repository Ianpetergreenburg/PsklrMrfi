class PrototypesController < ApplicationController
  def show
    @prototype = Prototype.find(params[:id])
    @manufacturer = Manufacturer.find(@prototype.manufacturer_id)
    respond_to do |format|
      format.html { render 'show'}
      format.js
    end
  end
end
