class Tag < ActiveRecord::Base
  has_many :tag_links
  has_many :posts, :through => :tag_links

  def self.add_tag(post_tags)
    post_tags = post_tags.split(',').map{|tag| tag.strip.downcase}
    tag_ids = Array.new
    
    post_tags.each do |tag|
      if where(name: tag).empty?
        new_tag = create(name: tag)
        tag_ids.push(new_tag.id)
      else
        tag_ids.push(where(name: tag).first.id)
      end
    end   
    tag_ids
  end

  def self.find_posts(tag)
    where(name: tag).first.posts
  end
end
