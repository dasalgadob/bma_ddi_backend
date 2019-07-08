class Dimension < ApplicationRecord
  belongs_to :name, class_name: "Translation"
  belongs_to :description, class_name: "Translation"
end
