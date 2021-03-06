get '/login' do
  erb :'/login'
end

post '/login' do
  @user = User.find_by(user_name: params[:user_name])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/posts"
  else
    @errors = "Invalid username or password"
    erb :'/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
