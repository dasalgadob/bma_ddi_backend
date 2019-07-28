class Interview < ApplicationRecord
  serialize :dimentions, JSON
  serialize :motivational_questions, JSON
  belongs_to :user
  has_many :interview_questions
  has_many :questions, through: :interview_questions

  scope :by_name, ->(n) { where("interviews.name ilike ?", '%' +n + '%')}
  scope :by_company, ->(c) { where("interviews.company ilike ?", '%' +c + '%')}
  scope :by_interviewer, ->(int) { searchTerm = '%' +int + '%'
    joins(:user)
  .where("users.name || ' ' || users.last_name  ilike ? or  users.name ilike ? or users.last_name ilike ? or users.email ilike ?",searchTerm, searchTerm, searchTerm, searchTerm)}


  def self.execute_sql(*sql_array)
    connection.execute(send(:sanitize_sql_array, sql_array))
   end

  #attr_reader
  def dimensions
    Interview.execute_sql("
    select t.spanish,d.id, count(*) from interviews 
    join interview_questions on (interviews.id = interview_questions.interview_id)
    join questions q on (interview_questions.question_id = q.id)
    join dimensions d on (q.dimension_id = d.id)
    join translations t on (d.name_id = t.id)
    where interviews.id=? and d.id <> 43 group by d.id, t.spanish
    ", self.id)
  end

  def add_interview_questions(questions_array)
    questions_array.each do |qi|
      q = Question.find(qi)
      if q
        InterviewQuestion.create(interview_id: self.id, question_id: q.id)
      end
    end
  end

end