get '/register' do
  erb :'register'
end


post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/posts'
  else
    redirect '/register'
  end
end

get '/users/:id' do
  erb :'/users/show'
end