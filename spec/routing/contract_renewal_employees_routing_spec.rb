require "rails_helper"

RSpec.describe ContractRenewalEmployeesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/contract_renewal_employees").to route_to("contract_renewal_employees#index")
    end

    it "routes to #show" do
      expect(:get => "/contract_renewal_employees/1").to route_to("contract_renewal_employees#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/contract_renewal_employees").to route_to("contract_renewal_employees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contract_renewal_employees/1").to route_to("contract_renewal_employees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contract_renewal_employees/1").to route_to("contract_renewal_employees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contract_renewal_employees/1").to route_to("contract_renewal_employees#destroy", :id => "1")
    end
  end
end
