class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates_presence_of :short_description
  validates_length_of :short_description, maximum: 50, message: "Tighten that description up. Maximum 50 characters."
  validates_presence_of :user_id
  has_many :votes
  has_many :comments, as: :commentable
  belongs_to :user

  def Link.order_by_points
    self.all.sort { |link1, link2| link2.points <=> link1.points }
  end

  def points
    age_in_minutes = (DateTime.now.to_i - self.created_at.to_i).to_i / 60
    how_many_15_minutes_have_passed = (age_in_minutes / 15) + 1 
    votes.count / how_many_15_minutes_have_passed
  end
end
