class AddBusinessUnitsRecords < ActiveRecord::Migration[5.2]
  def self.up
    BusinessUnit.create(code: "<3575c318.bmapr.com@amer.teams.ms>", name: "Commercial and Customer Service")
    BusinessUnit.create(code: "<560e70f3.bmapr.com@amer.teams.ms>", name: "Engineering & Manufacturing")
    BusinessUnit.create(code: "<35bc8024.bmapr.com@amer.teams.ms>", name: "Financial Services & Management")
    BusinessUnit.create(code: "<dd2a57c3.bmapr.com@amer.teams.ms>", name: "Warehouse and Distribution")
  end

  def self.down
    BusinessUnit.delete_all
  end
end
