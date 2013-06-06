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
  if params[:id]
    post = params[:id]
  else
    post = Post.new(title: params[:title], content: params[:content])
  end
  post.title = params[:title]
  post.content = params[:content]
  tags = params[:tags].split(",")
  tags = tags.map { |name| Tag.find_or_create_by_name(name: name) }
  post.tags = tags 
  post.save
  redirect '/posts'
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id].to_i)
  erb :create_post
end

post '/posts/delete/:id' do
  Post.find(params[:id].to_i).destroy
  redirect '/posts'
end
