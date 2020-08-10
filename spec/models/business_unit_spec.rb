require 'rails_helper'

RSpec.describe BusinessUnit, type: :model do

  it "is not valid without a code" do
    expect(BusinessUnit.new(name: "Commercial and Customer Service")).to_not be_valid
  end

  it "is not valid without the name" do
    expect(BusinessUnit.new(code: "<3575c318.bmapr.com@amer.teams.ms>")).to_not be_valid
  end

  it "is valid when code and name are present" do
    expect(BusinessUnit.new(name: "Commercial and Customer Service", code: "<3575c318.bmapr.com@amer.teams.ms>")).to be_valid
  end
end
