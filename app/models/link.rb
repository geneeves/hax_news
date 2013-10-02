class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates_presence_of :short_description
  validates_length_of :short_description, maximum: 50, message: "Tighten that description up a bit. Maximum 50 characters."
  has_many :votes

  def Link.order_by_votes
    self.all.sort { |link1, link2| link2.votes.count <=> link1.votes.count }
  end

  def points
    p age = (DateTime.now.to_i - self.created_at.to_i).to_i / 60
    demerit = age / 15 
    puts age
    self.votes.count / demerit
  end
end