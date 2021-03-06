class ResultSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :position, :base_salary, :benefits,
   :salary_expectations, :country_of_residence, :geographical_areas, :company, :phone_number, :user, :candidate, :answers_to_dimensions, 
   :is_not_finished, :dimensions
   #belongs_to :question
   #has_many :answers
   has_many :answers_to_dimensions
   #include :answers_to_dimensions
end
