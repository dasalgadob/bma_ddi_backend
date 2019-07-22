class InterviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :dimensions, 
   :company, :user_id, :created_at, :updated_at
   has_many :questions
end
