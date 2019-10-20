class CreateContractRenewalLists < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_renewal_lists do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
