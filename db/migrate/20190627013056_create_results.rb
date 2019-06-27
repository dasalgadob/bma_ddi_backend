class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :position
      t.text :answers
      t.text :motivational_competence
      t.string :base_salary
      t.string :benefits
      t.string :salary_expectations
      t.text :geographical_areas
      t.string :company
      t.boolean :editable
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
