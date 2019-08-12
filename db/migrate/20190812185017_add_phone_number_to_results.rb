class AddPhoneNumberToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :phone_number, :string
  end
end
