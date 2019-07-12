class Interview < ApplicationRecord
  serialize :dimentions, JSON
  serialize :motivational_questions, JSON
  belongs_to :user
  has_many :questions, through: :interview_questions

  scope :by_name, ->(n) { where("interviews.name ilike ?", '%' +n + '%')}
  scope :by_company, ->(c) { where("interviews.company ilike ?", '%' +c + '%')}
  scope :by_interviewer, ->(int) { searchTerm = '%' +int + '%'
    joins(:user)
  .where("users.name || ' ' || users.last_name  ilike ? or  users.name ilike ? or users.last_name ilike ? or users.email ilike ?",searchTerm, searchTerm, searchTerm, searchTerm)}
end
