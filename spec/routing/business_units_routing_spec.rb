require "rails_helper"

RSpec.describe BusinessUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/business_units").to route_to("business_units#index")
    end

    it "routes to #show" do
      expect(:get => "/business_units/1").to route_to("business_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/business_units").to route_to("business_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business_units/1").to route_to("business_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business_units/1").to route_to("business_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_units/1").to route_to("business_units#destroy", :id => "1")
    end
  end
end
