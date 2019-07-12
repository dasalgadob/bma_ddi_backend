class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :code, :translation, :translation_b
end
