helpers do 
  def tags(post)
    tags = Array.new
      post.tags.each do |tag|
        tags.push(tag.name)
      end
    tags.join(',') 
  end
end