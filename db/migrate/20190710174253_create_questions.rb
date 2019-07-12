class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.text :code
      t.references :translation
      t.references :translation_b
      t.boolean :mandatory, default: false
      t.references :dimension, foreign_key: true
      t.timestamps
    end
    add_foreign_key :questions, :translations, column: :translation_id
    add_foreign_key :questions, :translations, column: :translation_b_id
  end
end
