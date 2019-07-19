class Question < ApplicationRecord
  belongs_to :translation
  belongs_to :translation_b, optional: true
  belongs_to :name, class_name: "Translation", optional: true
  belongs_to :description, class_name: "Translation", optional: true
  belongs_to :dimension
  has_many :interviews, through: :interview_questions

  ##Return questions that belongs to the dimension motivational and are not mandatory.
  scope :by_motivational_dimension, 
  -> (md) { where 'questions.dimension_id = 43 and questions.mandatory = false and true= ?', md}
  #Just returns the mandatory general and open question 
  scope :mandatory, -> (m) {where(mandatory: m)} 
end
