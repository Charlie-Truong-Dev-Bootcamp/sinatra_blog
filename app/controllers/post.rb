
get '/create' do
  erb :create
end

post '/create' do
  new_post = Post.add_post(params)
  if new_post.errors.messages.empty?
    tag_ids = Tag.add_tag(params[:tag])
    TagLink.add_link(new_post.id, tag_ids)
    redirect ('/')
  else
    @entered_data = params
    @errors = new_post.errors.messages
    erb :error
  end
end

get '/post/:post_id' do
  @posts = Post.where(id: params[:post_id])
  @view = "single"
  erb :index
end

get '/edit/:post_id' do
  @post = Post.find(params[:post_id])
  @tags = tags(@post)
  erb :edit
end

post '/edit/:post_id' do
  post_id = Post.update_post(params)
  tag_ids = Tag.add_tag(params[:tag])
  TagLink.update_link(post_id, tag_ids)
  redirect ("/post/#{params[:post_id]}")
end

post '/delete/:post_id' do
  post_id = params[:post_id].to_i
  Post.delete_post(post_id)
  TagLink.delete_link(post_id)
  redirect ("/")
end