class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  has_secure_password
  has_many :votes
  has_many :comments
  has_many :links
end
