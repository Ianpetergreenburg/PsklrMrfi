class PrototypesController < ApplicationController
  
  def show
    if current_user_commissioner
    @prototype = Prototype.find(params[:id])
    p @prototype
    @manufacturer = Manufacturer.find(@prototype.manufacturer_id)
    respond_to do |format|
      format.html { render 'show', layout: false}
      format.js
    end
  else
    redirect_to index_customer_path
    end
  end
end
