# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


users = 5.times do

  User.create( :name => Faker::Name.name,
            :email => Faker::Internet.email,
            :password => 'password')
end

questions = 10.times do

  Question.create( :question => Faker::HarryPotter.quote,
                :user_id => rand(1..5) )

end

# questioncomments = 5.times do
#   QuestionComment.create(  :comment => Faker::Lorem.sentence,
#                         :user_id => rand(1..5),
#                         :question_id => rand(1..10) )
# end

# answers = 15.times do
#   Answer.create(   :answer => Faker::Lorem.paragraph,
#                 :user_id => rand(1..5),
#                 :question_id => rand(1..10) )
# end

# answercomments = 5.times do
#   AnswerComment.create(  :comment => Faker::Lorem.sentence,
#                       :user_id => rand(1..5),
#                       :answer_id => rand(15) )
# end

# questionvotes = rand(10..50).times do
#   QuestionVote.create( :question_id => rand(1..10),
#                     :user_id => rand(1..5),
#                     :up => 1,
#                     :down => nil)
# end

# questionvotes = rand(10..50).times do
#   QuestionVote.create( :question_id => rand(1..10),
#                     :user_id => rand(1..5),
#                     :up => nil,
#                     :down => -1)
# end

# answervotes = rand(10..50).times do
#   AnswerVote.create( :answer_id => rand(1..15),
#                   :user_id => rand(1..5),
#                   :up => 1,
#                   :down => nil)
# end

# answervotes = rand(10..50).times do
#   AnswerVote.create( :answer_id => rand(1..15),
#                   :user_id => rand(1..5),
#                   :up => nil,
#                   :down => -1)
# end
