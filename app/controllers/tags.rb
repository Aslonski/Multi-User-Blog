get '/tags' do
  @tags = Tag.all
  erb :'/tags/index'
end

get '/tags/:id/posts' do
  @taggings = Tagging.where(tag_id: params[:id])
  erb :'/taggings/index'
end