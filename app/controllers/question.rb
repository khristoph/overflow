get '/question/:id' do
  question = Question.find(params[:id])
  erb :question, locals: { question: question}
end

post '/question' do
  @question = Question.create({title: params[:title], question_text: params[:question_text], user_id: session[:user_id]})
  redirect "/question/#{@question.id}"
end

post "/answer/:id" do
	answer = Answer.create({answer_text: params[:answer_text], best_answer: false, user_id: session['user_id'], question_id: params[:id]})
	question = Question.find(params[:id])
	if request.xhr?
		erb :answer, locals: {answer: answer, question: question}, layout: false
	else

	redirect "/question/#{question.id}"

	end
end

post "/comment/:id/question" do
	@comment = Comment.create({comment_text: params[:comment_text], user_id: session['user_id'], commentable_id: params[:id], commentable_type: :Question})
	question = Question.find(params[:id])
	if request.xhr?
		erb :comment, layout: false, locals: {data: @comment, question: question}
	else
		redirect "/question/#{question.id}"
	end
end

post "/comment/:id/:answer" do
	@comment = Comment.create({comment_text: params[:comment_text], user_id: session['user_id'], commentable_id: params[:answer], commentable_type: :Answer})
	question = Question.find(params[:id])
	answer = Answer.find(params[:answer])
	if request.xhr?
		erb :comment, layout: false, locals: {data: @comment, answer: answer, question: question}
	else
		redirect "/question/#{question.id}"
	end
end

