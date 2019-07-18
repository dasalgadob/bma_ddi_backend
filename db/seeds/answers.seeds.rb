

Result.all.each do |r|
    ##Iterate trough dimensions from interviews 
    r.answers.each do |dimension, value_dimension|
        #Iterate trough answers of dimensions
        r.answers[dimension].each do |q_code, q_answer |
            q = Question.where(code: q_code).first
            #puts q
            Answer.create(situation: q_answer['situation'], action: q_answer['action'], result: q_answer['result'],
                          resume: q_answer['resume'], rating: q_answer['rating'], impact: q_answer['impact'], 
                          communication: q_answer['comunication'], result: r, question: q)
        end

    end
    #Iterate trough answers of motivational dimension
    #v_mc stands for value_motivational_competence
    r.motivational_competence['answers'].each do |code_mc, v_mc|
        q1 = Question.where(code: code_mc).first
        Answer.create(resume: v_mc['answer'], rating: v_mc['rating'], option: v_mc['option'], 
                      result: r, question: q1)
        #puts "not implemented"
    end

    q2 =  Question.joins(:translation).where(" mandatory is true and translations.spanish ilike 'pregunta general%' ").first
    Answer.create(result: r, question_id: q2.id, resume: r.motivational_competence['general_question']['answer'],
                  rating: r.motivational_competence['general_question']['rating'])
   
    q3 =  Question.joins(:translation).where(" mandatory is true and translations.spanish ilike 'pregunta abierta%' ").first
    Answer.create(result: r, question_id: q3.id, resume: r.motivational_competence['open_question']['answer'],
                rating: r.motivational_competence['open_question']['rating'])                  

end