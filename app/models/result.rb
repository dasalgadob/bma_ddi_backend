class Result < ApplicationRecord
  serialize :answers, JSON
  serialize :motivational_competence, JSON
  belongs_to :user
  belongs_to :candidate
  belongs_to :interview, optional: true

  has_many :answers_to_dimensions, class_name: 'Answer', foreign_key: "result_id"

  scope :by_position, ->(p) { where("results.position ilike ?", '%' +p + '%')}
  scope :by_company, ->(c) { where("results.company ilike ?", '%' +c + '%')}
  scope :by_interviewer, ->(int) { joins(:user).where("users.name ilike ? or users.last_name ilike ? or users.email ilike ?",'%' +int + '%','%' +int + '%','%' +int + '%')}
  scope :by_candidate, ->(c) { joins(:candidate).where("candidates.name ilike ?  or candidates.email ilike ?",'%' +c + '%','%' +c + '%')}

  def self.execute_sql(*sql_array)
    connection.execute(send(:sanitize_sql_array, sql_array))
   end


   #attr_reader
  def dimensions
    Result.execute_sql("
    select t.spanish,d.id, count(*) from results r
    join answers a on (r.id = a.result_id)
    join questions q on (a.question_id = q.id)
    join dimensions d on (q.dimension_id = d.id)
    join translations t on (d.name_id = t.id)
    where r.id=? and d.id <> 43 group by d.id, t.spanish
    ", self.id)
  end

end
