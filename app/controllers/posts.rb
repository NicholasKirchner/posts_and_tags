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
  post = params[:id] ? Post.find(params[:id]) : Post.new
  post.title = params[:title]
  post.content = params[:content]
  tags = params[:tags].split(",")
  tags = tags.map { |name| Tag.find_or_create_by_name(name: name) }
  post.tags = tags
  if post.valid?
    post.save
    redirect '/posts'
  else
    @errors = post.errors
    @post = post
    erb :create_post
  end
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id].to_i)
  erb :create_post
end

post '/posts/delete/:id' do
  Post.find(params[:id].to_i).destroy
  redirect '/posts'
end
