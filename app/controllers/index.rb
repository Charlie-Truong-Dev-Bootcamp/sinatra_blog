get '/' do
  # Look in app/views/index.erb
  @posts = Post.all_posts_descending
  @view = "list"
  erb :index
end



