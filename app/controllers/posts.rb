def extract_tags(tag_string)
  tag_string.split(",").map { |name| Tag.find_or_create_by_name(name: name.strip) }
end

get '/posts' do
  erb :list_posts
end

get '/post/:id' do
  @post = Post.find(params[:id].to_i)
  erb :view_post
end

get '/posts/create' do
  @post = PostPresenter.new(Post.new)
  erb :create_post
end

post '/posts/create' do
  params[:post][:tags] = extract_tags(params[:tags])
  post = Post.new_or_edited(params[:post])
  @post = PostPresenter.new(post)

  if @post.valid?
    redirect '/posts'
  else
    erb :create_post
  end
end

get '/posts/edit/:id' do
  @post = PostPresenter.new(Post.find(params[:id].to_i))
  erb :create_post
end

post '/posts/delete/:id' do
  Post.find(params[:id].to_i).destroy
  redirect '/posts'
end


class PostPresenter
  def initialize(post)
    @post = post
  end

  def delete_button_template
    editing? ? :_post_delete_button : :_null_partial
  end

  def errors_template
    errors.any? ? :_errors : :_null_partial
  end

  def id_field_template
    editing? ? :_post_id : :_null_partial
  end

  def action
    @post.id ? "Edit" : "Create"
  end

  def tags
    @post.tags.map { |tag| tag.name }.join(",")
  end

  def editing?
    @post.persisted?
  end

  def title
    @post.title
  end

  def content
    @post.content
  end

  def id
    @post.id
  end

  def valid?
    @post.valid?
  end

  def errors
    @post.errors
  end
end