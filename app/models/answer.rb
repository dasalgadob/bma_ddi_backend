class Answer < ApplicationRecord
  belongs_to :result
  belongs_to :question

  def self.execute_sql(*sql_array)
    connection.execute(send(:sanitize_sql_array, sql_array))
   end

   def dimension
    Answer.execute_sql("
    select d.id,t.spanish from answers a
    join questions q on (a.question_id = q.id)
    join dimensions d on (q.dimension_id = d.id)
    join translations t on (d.name_id = t.id)
    where a.id=?  group by d.id, t.spanish
    ", self.id)
   end
end
