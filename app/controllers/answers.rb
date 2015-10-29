#C-New
get "/questions/questions_id/answers/new" do
	
end

#C-Create
post "/questions/:question_id/answers" do

	# if logged_in?
		# @user = User.find(session[:user_id])
		@question = Question.find(params[:question_id])
		
		# @answer = @question.answers.create(answer_detail: params[:answer][:answer_detail], user_id: @user.id)

		@answer = Answer.create(question_id: @question.id, answer_detail: params[:answer][:answer_detail], user_id: current_user.id)


	redirect to "/questions/#{@question.id}"

	# else
	# 	redirect to '/'
	# end

end

#R-Index
get "/questions/questions_id/answers" do
	
end

#R-show
get "/questions/questions_id/answers/:answers_id" do
	
end

#U-edit
get "/questions/questions_id/answers/:answers_id/edit" do
	
end

#U-update
put "/questions/questions_id/answers/:answers_id/edit" do
	
end

#U-delete
delete "/questions/questions_id/answers/:answers_id/edit" do
	
end