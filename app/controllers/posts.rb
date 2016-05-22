get '/posts' do
  @posts = Post.all
  @users = User.all
  erb :'/posts/index'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'/posts/edit'
end

get '/posts/:id/delete' do
  authorize!
  @post = Post.find(params[:id])
  @post.destroy if session[:user_id] == @post.author_id
  redirect '/posts'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts/new' do
  @posts = Post.create(title: params[:title], content: params[:content], author_id: current_user.id)
  redirect '/posts'
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect '/posts'
end