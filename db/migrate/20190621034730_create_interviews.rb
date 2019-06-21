class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :name
      t.text :dimentions
      t.text :motivational_questions
      t.string :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
