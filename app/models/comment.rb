class Comment <ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def link
    if self.commentable_type == "Link"
      self.commentable
    else
      self.commentable.link
    end
  end
end