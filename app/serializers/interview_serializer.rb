class InterviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :dimentions, :motivational_questions, :company, :user_id, :created_at, :updated_at
end
