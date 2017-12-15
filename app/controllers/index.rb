get '/' do
  @questions = Question.all
  erb :index, locals: {all_questions: @questions}
end


post '/best/:answer_id/:question_id' do
	
	Question.find(params[:question_id]).answers.each do |answer|
		answer.best_answer = false
	end
 
	answer = Answer.find(params[:answer_id])
	answer.best_answer = true

	if request.xhr?
		
	{ best_answer_id: answer.id }.to_json
	
	end
end