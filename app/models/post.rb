class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :title, :presence => true
  validates :content, :presence => true

  def self.new_or_edited(attributes)
    post = attributes[:id] ? Post.find(attributes[:id]) : Post.new
    post.update_attributes(attributes)
    post
  end

end
