
after :dimensions do

Interview.all.each do |i|
    i.dimentions.keys.each do |dim|
        i.dimentions[dim]['questions'].keys.each do |q|
            if i.dimentions[dim]['questions'][q] == true
                q = Question.where(code: q).first
                InterviewQuestion.create(question_id: q.id, interview_id: i.id)
            end
        end
    end 
end    

end