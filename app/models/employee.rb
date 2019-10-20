class Employee < ApplicationRecord
  belongs_to :business_unit
  validates :full_name, :email, :number_employee, presence: true
  validates :email, uniqueness: true
end
