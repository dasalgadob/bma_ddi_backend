class CreateContractRenewalEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_renewal_employees do |t|
      t.boolean :email_sent, default: false
      t.boolean :form_submitted, default: false
      t.datetime :email_sent_at
      t.datetime :form_submitted_at
      t.references :contract_renewal_list, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
