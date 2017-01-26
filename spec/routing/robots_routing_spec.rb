require 'rails_helper'

describe "Routing to robots", :type => :routing do
  
  it "routes GET /robots to robots#index" do
    expect(:GET => "/robots").to route_to("robots#index")
  end

  it "routes GET /robots/:id to robots#show" do
    expect(:GET => "/robots/1").to route_to("robots#show", :id => "1")
  end


end
