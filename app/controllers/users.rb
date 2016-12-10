get '/users/new' do
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
  @posts = Post.where(author_id: current_user.id)
  erb :'/users/show'
end