post '/questions' do #C -create
	session[:user_id]
	@user = User.find(session[:user_id])
	# @user.questions << @question = Question.new(question_detail: params[:question][:question_detail])
	# erb :'static/questions'
	@question = @user.questions.new(params[:question])
	if @question.save
		redirect to "/questions"
	else
		erb :'static/users'
	end
end

	
# 	if question = ""
# 		"Please enter your question!"
# 		redirect to "/questions"
# 	else
# 		question = user.questions.new(params[:question])
# 		question.save
# 		redirect to "/questions"
# 	end
# end

get '/questions' do #R- index
	@user = User.find(session[:user_id])
	@questions = Question.all
	erb :'static/users'
end

get '/questions/:q_id' do #R- show particular
	@question = Question.find(params[:q_id])
	erb :'static/answers'
end


