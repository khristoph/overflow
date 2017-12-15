get '/login' do
  @error = "Invalid email or password" if params['e']
  erb :login
end

post '/login' do
@user = User.authenticate(params['email'])
   if @user && @user.password == params['password']
      session[:user_id] = @user.id
      redirect '/'
   else
    redirect '/login?e=1'
   end
end

get '/register' do
  @error = "Email already exists." if params['e']
  erb :register
end

post '/register' do
  @user = User.authenticate(params['email'])
  if @user
    redirect '/register?e=1'
  else
    @user = User.create(params)
    session[:user_id] = @user.id
  end
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
