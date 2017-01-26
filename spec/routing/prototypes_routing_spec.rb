require 'rails_helper'

describe "Routing to prototype", :type => :routing do
  it "routes GET /prototypes/:id to prototypes#show" do
    expect(:get => "/prototypes/1").to route_to("prototypes#show", :id => "1")
  end
end
