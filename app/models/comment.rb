class Comment <ActiveRecord::Base
  # belongs_to :link
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end