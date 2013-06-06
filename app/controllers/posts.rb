get '/posts' do
  erb :list_posts
end

get '/post/:id' do
  @post = Post.find(params[:id].to_i)
  erb :view_post
end

get '/posts/create' do
  @post = session.delete(:post) if session[:post]
  @errors = session.delete(:errors) if session[:errors]
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
    session[:errors] = post.errors
    session[:post] = post
    redirect '/posts/create'
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
