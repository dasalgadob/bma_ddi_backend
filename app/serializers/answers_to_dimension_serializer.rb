class AnswersToDimensionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :answer
  attributes :id, :situation, :action, :resultado, :resume, :rating, :impact, :communication, :option, :question,
  :dimension

  belongs_to :question
end
