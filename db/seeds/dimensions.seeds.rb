

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

