class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :email
      t.references :business_unit, foreign_key: true
      t.integer :number_employee

      t.timestamps
    end
  end
end
