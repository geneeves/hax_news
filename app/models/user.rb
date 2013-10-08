class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :name
  validates_presence_of :email
  has_many :votes
  has_many :comments
  has_many :links
end