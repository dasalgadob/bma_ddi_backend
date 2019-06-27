class Result < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  scope :by_position, ->(p) { where("position ilike ?", '%' +p + '%')}
  scope :by_company, ->(c) { where("company ilike ?", '%' +c + '%')}
  scope :by_interviewer, ->(int) { joins(:user).where("users.name ilike ? or users.last_name ilike ? or users.email ilike ?",'%' +int + '%','%' +int + '%','%' +int + '%')}
  scope :by_candidate, ->(c) { joins(:candidate).where("candidates.name ilike ?  or candidates.email ilike ?",'%' +c + '%','%' +c + '%')}

end
