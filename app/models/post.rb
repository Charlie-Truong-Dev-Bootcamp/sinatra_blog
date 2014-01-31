class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
  validates :author, :presence => true
  has_many :tag_links
  has_many :tags, :through => :tag_links
  

  def self.all_posts_descending
    Post.order("created_at DESC")
  end

  def self.add_post(params)
    post = create(title: params[:title], body: params[:body], author: params[:author])
  end

  def self.update_post(params)
    post = update(params[:post_id].to_i, title: params[:title], body: params[:body], author: params[:author])
    post.id
  end

  def create_date_only
    created_at.to_date
  end

  def self.delete_post(id)
    Post.find(id).destroy
  end
end
