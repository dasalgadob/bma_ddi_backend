class Interview < ApplicationRecord
  serialize :dimentions, JSON
  serialize :motivational_questions, JSON
  belongs_to :user
end
