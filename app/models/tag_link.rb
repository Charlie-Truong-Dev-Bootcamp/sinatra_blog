class TagLink < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  
  def self.add_link(new_post_id, new_tag_ids)
    new_tag_ids.each do |new_tag_id|
      create(tag_id: new_tag_id, post_id: new_post_id)
    end
  end

  def self.update_link(post_id, tag_ids)
    delete_removed_tag(post_id, tag_ids)
    tag_ids.each do |tag_id|
      create(tag_id: tag_id, post_id: post_id) unless where(tag_id: tag_id, post_id: post_id).exists?
    end
  end

  def self.delete_removed_tag(post_id, tag_ids)
    where("post_id = ? and tag_id not in (?)",post_id,tag_ids).each do |link|
      link.destroy
    end
  end

  def self.delete_link(post_id)
    where(post_id: post_id).each do |link|
      link.destroy
    end
  end
end
