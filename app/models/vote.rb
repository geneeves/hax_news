class Vote < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :link_id
end