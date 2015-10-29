enable :sessions

get '/' do
	# case # this way to use keys method
	# when params.keys.include?("error")
	# 	@error = params[:error]
	# when params.keys.include?("message")
	# 	@message = params[:message]
	# when params.keys.include?("failed")
	# 	@failed = params[:failed]
	# end

	case 
	when !params[:error].nil?
		@error = params[:error]
	when !params[:message].nil?
		@message = params[:message]
	when !params[:failed].nil?
		@failed = params[:failed]
	end

	# if params[:error]
	# 	@error = params[:error]
	# end

	# if params[:message]
	# 	@message = params[:message]
	# end

	# if params[:failed]
	# 	@failed = params[:failed]
	# end



  erb :"static/index"
end

post '/signup' do
	@user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
	
	if @user.save
		@message = true
		@message = "Signed up. You may now login."
		# erb :'static/index'
		redirect to "/?message= = #{@message}"
	else
		@failed = "Invalid sign up" 
 		# erb :'static/index'
 		redirect to "/?failed=#{@failed}"
 	end
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])

	if @user.nil?
		@error = "Invalid Login"
		redirect to "/?error=#{@error}"
	else
		@success = "Successful log in!"
		session[:user_id] = @user.id
 		redirect to "users/#{@user.id}"
	end
end

post '/logout' do
	session[:user_id] = nil
	erb :"static/index"
end

get '/users/:id' do
	@user = User.find(params[:id])
	@questions = Question.all
	erb :'static/users'
end


