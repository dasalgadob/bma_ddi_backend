require 'rails_helper'

RSpec.describe Candidate, type: :model do
  
  it "is not valid without a name" do
    expect(Candidate.new(email: "dasalgadob@unal.edu.co")).to_not be_valid
  end

  it "is not valid without an email" do
    expect(Candidate.new(name: "Diego")).to_not be_valid
  end

  it "is valid when name and email are provided" do 
    expect(Candidate.new(name: "Diego", email: "dasalgadob@unal.edu.co")).to be_valid
  end

  it "is not valid when email field is not an email" do 
    expect(Candidate.new(name: "Diego", email: "dasalgadob")).to_not be_valid
  end
end
