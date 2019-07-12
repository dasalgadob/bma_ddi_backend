class AddActionsToDimensions < ActiveRecord::Migration[5.2]
  def change
    add_reference :dimensions, :actions
    add_foreign_key :dimensions, :translations, column: :actions_id
  end
end
