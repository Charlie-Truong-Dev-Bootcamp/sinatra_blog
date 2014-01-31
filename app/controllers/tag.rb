get '/posts_by_tag/:tag_name' do
  @view = "list"
  @posts = Tag.find_posts(params[:tag_name])
  erb :index
end