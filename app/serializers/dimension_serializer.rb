class DimensionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :actions
  has_many :questions
  #belongs_to :actions
end
