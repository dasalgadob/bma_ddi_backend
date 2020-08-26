require 'faker'


100.times do 
 Candidate.create(name: Faker::Name.first_name + ' ' + Faker::Name.last_name, email: Faker::Internet.email)
end