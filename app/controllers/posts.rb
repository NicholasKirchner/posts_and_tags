get '/posts' do
  erb :list_posts
end

get '/posts/:id' do
  @post = Post.find(params[:id].to_i)
  erb :view_post
end

get '/posts/create' do

end

post '/posts/create' do

end

get '/posts/edit/:id' do

end

post '/posts/delete/:id' do

end
