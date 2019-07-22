class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :situation, :action, :result, :resume, :rating, :impact, :communication, :option, :question
end
