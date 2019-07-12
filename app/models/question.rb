class Question < ApplicationRecord
  belongs_to :translation
  belongs_to :translation_b, optional: true
  belongs_to :dimension
end
