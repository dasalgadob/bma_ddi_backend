class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :code, :translation, :translation_b, :mandatory, :dimension_id, :dimension
  belongs_to :translation
  belongs_to :dimension
end
