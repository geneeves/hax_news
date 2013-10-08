class Comment <ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  validates_presence_of :comment_text
  validates_presence_of :user_id


  def link
    if self.commentable_type == "Link"
      self.commentable
    else
      self.commentable.link
    end
  end
end