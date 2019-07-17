

##Creation of translations for the name and description of the dimension

t1 = Translation.create( english: "Motivational Compatibility", spanish: "Compatibilidad Motivacional" )
t2 = Translation.create(spanish: "La medida en que las actividades y responsabilidades del puesto, la modalidad de operación y los valores de la organización, y la comunidad en la cual el individuo vivirá, se corresponden con el tipo de ambiente que brinda satisfacción personal; el grado en el cual el propio trabajo es personalmente satisfactorio.",
    english: "The extent to which the activities and responsibilities of the position, mode of operation and values of the organization and the community in which individuals live, correspond to the type of environment that provides personal satisfaction;  the extent to which the work itself is personally satisfying.")

d = Dimension.create(id:43, name: t1, description:  t2)


m_d_file_en = File.read('db/backup/motivational-constant-en.json')
m_d_file_es = File.read('db/backup/motivational-constant-es.json')

dim_es_json = JSON.parse(m_d_file_es)
dim_en_json = JSON.parse(m_d_file_en)

t4 = Translation.create( english: "General Question: When were you most satisfied / dissatisfied in your work? What was the most satisfactory / unsatisfactory that?", 
spanish: "Pregunta General: ¿Cuándo estuvo usted más satisfecho/insatisfecho en su trabajo?  ¿Qué fue lo más satisfactorio/insatisfactorio de eso?.")
Question.create(translation: t4, dimension: d, mandatory: true)

t5 = Translation.create( english: "Open Question: Tell me about a time when I had a couple / few opportunities _____________ in their work.  How satisfied were you with that and why?",
spanish: "Pregunta Abierta: Hábleme de una ocasión en la que tuvo varias/pocas oportunidades de _________ en su trabajo.  ¿Qué tan satisfecho estuvo usted con eso y por qué?.")
Question.create(translation: t5, dimension: d, mandatory: true)


dim_es_json['motivational_questions'].each do |k,v|
    puts k
    puts v
    t6 = Translation.create( english: dim_en_json['motivational_questions'][k]['name'], 
    spanish:  v['name'])
    t7 = Translation.create( english: dim_en_json['motivational_questions'][k]['text'], 
    spanish:  v['text'])
    t8 = Translation.create( english: dim_en_json['motivational_questions'][k]['a'], 
    spanish:  v['a'])
    if dim_en_json['motivational_questions'][k]['b']
        t9 = Translation.create( english: dim_en_json['motivational_questions'][k]['b'], 
        spanish:  v['b'])
    else
        t9 = nil
    end
    Question.create(translation: t8 , translation_b_id: t9 , dimension: d, name: t6, description: t7,
    code: k)
    #puts mq
end

