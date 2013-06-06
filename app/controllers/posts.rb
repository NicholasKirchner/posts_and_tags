get '/posts' do
  erb :list_posts
end

get '/post/:id' do
  @post = Post.find(params[:id].to_i)
  erb :view_post
end

get '/posts/create' do
  erb :create_post
end

post '/posts/create' do

end

get '/posts/edit/:id' do
  @post = Post.find(params[:id].to_i)
  erb :create_post
end

post '/posts/delete/:id' do

end
