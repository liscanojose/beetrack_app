require "rails_helper"

RSpec.describe VehiclesController, type: :routing do
  describe "routing" do
    it "routes to #home" do
      expect(get: "show").to route_to("vehicles#show")
    end
    it "routes to #show" do
      expect(get: "show").to route_to("vehicles#show")
    end
  end
end
