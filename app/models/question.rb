class Question < ApplicationRecord
  belongs_to :translation
  belongs_to :translation_b, optional: true
  belongs_to :name, class_name: "Translation", optional: true
  belongs_to :description, class_name: "Translation", optional: true
  belongs_to :dimension
  has_many :interviews, through: :interview_questions

end
