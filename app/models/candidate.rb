class Candidate < ApplicationRecord
    validates :name, :email, presence: true
    validates :email, uniqueness: true

    has_many :results
end
