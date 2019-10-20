require "rails_helper"

RSpec.describe ContractRenewalListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/contract_renewal_lists").to route_to("contract_renewal_lists#index")
    end

    it "routes to #show" do
      expect(:get => "/contract_renewal_lists/1").to route_to("contract_renewal_lists#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/contract_renewal_lists").to route_to("contract_renewal_lists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contract_renewal_lists/1").to route_to("contract_renewal_lists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contract_renewal_lists/1").to route_to("contract_renewal_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contract_renewal_lists/1").to route_to("contract_renewal_lists#destroy", :id => "1")
    end
  end
end
