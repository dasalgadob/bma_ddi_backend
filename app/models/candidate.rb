class Candidate < ApplicationRecord
    validates :name, :email, presence: true
    validates :email, uniqueness: true

    scope :by_name, ->(n) { where("candidates.name ilike ?", '%' +n + '%')}
    scope :by_email, ->(n) { where("candidates.email ilike ?", '%' +n + '%')}
    has_many :results
end
