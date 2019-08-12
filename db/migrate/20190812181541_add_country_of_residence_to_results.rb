class AddCountryOfResidenceToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :country_of_residence, :string
  end
end
