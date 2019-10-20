require 'rails_helper'

RSpec.describe "BusinessUnits", type: :request do
  describe "GET /business_units" do
    it "works! (now write some real specs)" do
      get business_units_path
      expect(response).to have_http_status(200)
    end
  end
end
