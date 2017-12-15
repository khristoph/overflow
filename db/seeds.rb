20.times do
  user = User.create!( email: Faker::Internet.email, password_hash: "password")
end

5.times do
  question = Question.create( title: Faker::Hipster.sentence(2), question_text: Faker::Lorem.paragraph, user_id: rand(1..20))
end

10.times do
  answer = Answer.create( answer_text: Faker::Lorem.paragraph, best_answer: false, user_id: rand(1..20), question_id: rand(1..5))
end


20.times do
  comment = Comment.create( comment_text: Faker::Lorem.sentence(3), user_id: rand(1..20), commentable_type: :Answer , commentable_id: rand(1..10))
end

20.times do
	comment = Comment.create( comment_text: Faker::Lorem.sentence(3), user_id: rand(1..20), commentable_type: :Question , commentable_id: rand(1..5))
end


  500.times do
    vote = Vote.create( value: rand(1..2), votable_type: :Comment, votable_id: rand(1..40), user_id: rand(1..20) )
    vote = Vote.create( value: rand(1..2), votable_type: :Answer, votable_id: rand(1..10), user_id: rand(1..20) )
    vote = Vote.create( value: rand(1..2), votable_type: :Question, votable_id: rand(1..5), user_id: rand(1..20) )
  end



