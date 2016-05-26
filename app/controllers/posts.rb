get '/posts' do
  @posts = Post.all
  @users = User.all
  erb :'/posts/index'
end

get '/posts/:id/edit' do
  @post = current_user.posts.find(params[:id])
  erb :'/posts/edit'
end

delete '/posts/:id' do
  @post = current_user.posts.find(params[:id])
  @post.destroy
  redirect '/posts'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts' do
  @posts = current_user.posts.create(title: params[:title], content: params[:content])
  redirect '/posts'
end

put '/posts/:id' do
  @post = current_user.posts.find(params[:id])
  @post.update_attributes(params[:post])
  redirect '/posts'
end