class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :situation
      t.text :action
      t.text :result
      t.text :resume
      t.integer :rating
      t.integer :impact
      t.integer :communication
      t.string :option
      t.references :result, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
