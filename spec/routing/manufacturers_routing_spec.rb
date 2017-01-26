require 'rails_helper'

describe "Routing to manufacturer", :type => :routing do
  it "routes GET /manufacturers/:id to manufacturers#show" do
    expect(:get => "/manufacturers/1").to route_to("manufacturers#show", :id => "1")
  end
end
