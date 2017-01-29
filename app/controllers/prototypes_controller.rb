class PrototypesController < ApplicationController

  def show
    if current_user_commissioner
      @prototype = Prototype.find(params[:id])
      @manufacturer = Manufacturer.find(@prototype.manufacturer_id)
      respond_to do |format|
        format.html { render 'show', layout: false}
        format.js
      end
    elsif current_user
      redirect_to index_customer_path
    else
      redirect_to '/'
    end
  end
end
