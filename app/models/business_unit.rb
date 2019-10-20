class BusinessUnit < ApplicationRecord
    validates :code, :name, presence: true
end
