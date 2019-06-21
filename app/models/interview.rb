class Interview < ApplicationRecord
  serialize :dimentions, JSON
  serialize :motivational_questions, JSON
  belongs_to :user

  scope :by_name, ->(n) { where("name ilike ?", '%' +n + '%')}
  scope :by_company, ->(c) { where("company ilike ?", '%' +c + '%')}
  scope :by_interviewer, ->(int) { joins(:user).where("users.name ilike ? or users.last_name ilike ? or users.email ilike ?",'%' +int + '%','%' +int + '%','%' +int + '%')}
end
