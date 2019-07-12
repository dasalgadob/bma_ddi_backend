

dim_file_es = File.read('db/backup/dimensions_es.json')
dim_file_en = File.read('db/backup/dimensions_en.json')

dim_es_json = JSON.parse(dim_file_es)
dim_en_json = JSON.parse(dim_file_en)


for i in 1..dim_es_json.length
    name_en= dim_en_json[i-1]['name']
    name_es= dim_es_json[i-1]['name']
    description_en = dim_en_json[i-1]['text']
    description_es = dim_es_json[i-1]['text']
    actions_en = dim_en_json[i-1]['actions']
    actions_es = dim_es_json[i-1]['actions']
    question_en = ""
    question_es = ""
    ##Creation of translations for the name and description of the dimension
    t1 = Translation.create( english: name_en, spanish: name_es )
    t2 = Translation.create(english: description_en, spanish: description_es)
    t3 = Translation.create( english: actions_en, spanish: actions_es)
    d = Dimension.create(id: i, name: t1, description:  t2, actions: t3)
    
    ##Creation of the questions for each dimension
    #puts  dim_es_json[i-1]['actions']
    dim_es_json[i-1]['questions'].each do |k ,v|
        #puts  q
        question_en = dim_en_json[i-1]['questions'][k]
        question_es = v
        t4 = Translation.create( english: question_en, spanish: question_es)
        Question.create(translation: t4, code: k, dimension: d)
    end
    #puts i
end


=begin
Translation.create(id: 1,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 2,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 1, name: Translation.find(1), description:  Translation.find(2))

Translation.create(id: 3,english: 'Analysis / Assessment of problems', spanish: 'Análisis/Evaluación de Problemas')
Translation.create(id: 4,english: 'Obtain relevant information and identifying key issues and relationships from a base of information;  relate and compare data from different sources;  identify cause-effect relationships.',
 spanish: 'Obtener información relevante e identificar los asuntos y relaciones clave a partir de una base de información; relacionar y comparar datos de diferentes fuentes; identificar las relaciones de causa-efecto.')
Dimension.create(id: 2, name: Translation.find(3), description:  Translation.find(4))

Translation.create(id: 5,english: 'Practical Learning', spanish: 'Aprendizaje Práctico')
Translation.create(id: 6,english: 'Assimilate and implement, in a timely manner, information regarding the position can vary in complexity.',
 spanish: 'Asimilar y aplicar, de una manera oportuna, información relacionada con el puesto que pueda variar en su complejidad.')
Dimension.create(id: 3, name: Translation.find(5), description:  Translation.find(6))

Translation.create(id: 7,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 8,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 4, name: Translation.find(7), description:  Translation.find(8))

Translation.create(id: 9,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 10,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 5, name: Translation.find(9), description:  Translation.find(10))

Translation.create(id: 11,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 12,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 6, name: Translation.find(11), description:  Translation.find(12))

Translation.create(id: 13,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 14,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 7, name: Translation.find(13), description:  Translation.find(14))

Translation.create(id: 15,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 16,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 8, name: Translation.find(15), description:  Translation.find(16))

Translation.create(id: 17,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 18,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 9, name: Translation.find(17), description:  Translation.find(18))


Translation.create(id: 19,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 20,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 10, name: Translation.find(19), description:  Translation.find(20))

Translation.create(id: 21,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 22,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 11, name: Translation.find(21), description:  Translation.find(22))

Translation.create(id: 23,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 24,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 12, name: Translation.find(23), description:  Translation.find(24))

Translation.create(id: 25,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 26,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 13 name: Translation.find(25), description:  Translation.find(26))

Translation.create(id: 27,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 28,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 14 name: Translation.find(27), description:  Translation.find(28))

Translation.create(id: 29,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 30,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 15 name: Translation.find(29), description:  Translation.find(30))

Translation.create(id: 31,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 32,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 16 name: Translation.find(31), description:  Translation.find(32))

Translation.create(id: 33,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 34,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 17 name: Translation.find(33), description:  Translation.find(34))

Translation.create(id: 35,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 36,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 18 name: Translation.find(35), description:  Translation.find(36))

Translation.create(id: 37,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 38,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 19 name: Translation.find(37), description:  Translation.find(38))

Translation.create(id: 39,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 40,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 20 name: Translation.find(39), description:  Translation.find(40))

Translation.create(id: 41,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 42,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 21 name: Translation.find(41), description:  Translation.find(42))

Translation.create(id: 43,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 44,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 22 name: Translation.find(43), description:  Translation.find(44))

Translation.create(id: 45,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 46,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 23 name: Translation.find(45), description:  Translation.find(46))

Translation.create(id: 47,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 48,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 24 name: Translation.find(47), description:  Translation.find(48))

Translation.create(id: 49,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 50,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 25 name: Translation.find(49), description:  Translation.find(50))

Translation.create(id: 51,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 52,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 26 name: Translation.find(51), description:  Translation.find(52))

Translation.create(id: 53,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 54,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 27 name: Translation.find(53), description:  Translation.find(54))

Translation.create(id: 55,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 56,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 28 name: Translation.find(55), description:  Translation.find(56))


Translation.create(id: 57,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 58,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 29 name: Translation.find(57), description:  Translation.find(58))

Translation.create(id: 59,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 60,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 30 name: Translation.find(59), description:  Translation.find(60))

Translation.create(id: 61,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 62,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 31 name: Translation.find(61), description:  Translation.find(62))

Translation.create(id: 63,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 64,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 32 name: Translation.find(63), description:  Translation.find(64))

Translation.create(id: 65,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 66,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 33 name: Translation.find(65), description:  Translation.find(66))

Translation.create(id: 67,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 68,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 34 name: Translation.find(67), description:  Translation.find(68))

Translation.create(id: 69,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 70,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 35 name: Translation.find(69), description:  Translation.find(70))

Translation.create(id: 71,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 72,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 36 name: Translation.find(71), description:  Translation.find(72))

Translation.create(id: 73,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 74,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 37 name: Translation.find(73), description:  Translation.find(74))

Translation.create(id: 75,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 76,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 38 name: Translation.find(75), description:  Translation.find(76))

Translation.create(id: 77,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 78,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 39 name: Translation.find(77), description:  Translation.find(78))

Translation.create(id: 79,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 80,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 40 name: Translation.find(79), description:  Translation.find(80))

Translation.create(id: 81,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 82,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 41 name: Translation.find(81), description:  Translation.find(82))

Translation.create(id: 83,english: 'Adaptability', spanish: 'Adaptabilidad')
Translation.create(id: 84,english: 'Maintain effectiveness in different tasks, responsibilities and people.', spanish: 'Mantener la eficacia en diferentes tareas, responsabilidades y personas.')
Dimension.create(id: 42 name: Translation.find(83), description:  Translation.find(84))
=end