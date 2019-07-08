class CreateDimensions < ActiveRecord::Migration[5.2]
  def change
    create_table :dimensions do |t|
      t.references :name
      t.references :description

      t.timestamps
    end
    add_foreign_key :dimensions, :translations, column: :name_id
    add_foreign_key :dimensions, :translations, column: :description_id
  end
end
