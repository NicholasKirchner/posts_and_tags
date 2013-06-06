get '/tags' do
  erb :list_tags
end

get '/tags/:id' do
  @tag = Tag.find(params[:id].to_i)
  erb :list_posts_with_tag
end
