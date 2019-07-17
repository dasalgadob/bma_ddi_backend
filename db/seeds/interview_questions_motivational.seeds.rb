#after :motivational_dimension do

    Interview.all.each do |i|
        i.motivational_questions.each do |k, v|
            #puts mq
            if v
            q = Question.where(code: k).first
            InterviewQuestion.create(interview_id: i.id ,
             question_id: q.id)
            end
        end
    end
#end