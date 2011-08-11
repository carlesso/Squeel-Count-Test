class Post < ActiveRecord::Base
  has_many :comments

  def self.popular
    Post.joins{comments}.group{comments.post_id}.select{"posts.*, count(\"comments\".\"post_id\") as comments_count"}.order{"comments_count desc"}
  end
end
