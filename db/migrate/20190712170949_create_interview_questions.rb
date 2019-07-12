class CreateInterviewQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :interview_questions do |t|
      t.references :interview, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
