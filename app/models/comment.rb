class Comment <ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates_presence_of :comment_text

  def link
    if self.commentable_type == "Link"
      self.commentable
    else
      self.commentable.link
    end
  end
end