class AnswersToDimensionSerializer
  include FastJsonapi::ObjectSerializer
  #set_type :answer
  attributes :id, :situation, :action, :result, :resume, :rating, :impact, :communication, :option, :question,
  :dimension
end
