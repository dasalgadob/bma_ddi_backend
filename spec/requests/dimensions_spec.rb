require 'rails_helper'

RSpec.describe "Dimensions", type: :request do
  describe "GET /dimensions" do
    it "works! (now write some real specs)" do
      get dimensions_path
      expect(response).to have_http_status(200)
    end
  end
end
