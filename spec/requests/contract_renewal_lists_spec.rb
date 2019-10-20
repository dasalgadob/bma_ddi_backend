require 'rails_helper'

RSpec.describe "ContractRenewalLists", type: :request do
  describe "GET /contract_renewal_lists" do
    it "works! (now write some real specs)" do
      get contract_renewal_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
