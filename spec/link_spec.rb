require 'spec_helper'

describe Link do

  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:short_description) }
  it { should ensure_length_of(:short_description).
    is_at_most(50).
    with_long_message("Tighten that description up a bit. Maximum 50 characters.") }
  it { should have_many(:votes) }

  it "makes an array of links ordered by the number of votes it has" do
    link1 = Link.create(:short_description => 'fake description', :url => "http://fake.net")
    link2 = Link.create(:short_description => 'fake description2', :url => "http://fake2.net")
    link3 = Link.create(:short_description => 'fake description3', :url => "http://fake.net3")
    vote = Vote.create(:link_id => link2.id)
    vote2 = Vote.create(:link_id => link2.id)
    vote3 = Vote.create(:link_id => link3.id)
    Link.order_by_votes.should eq [link2, link3, link1]
  end

  it "loses points for every half hour since it's been posted" do
    link = Link.create(:short_description => 'loser', :url => "http://losepoints.com")
    vote = Vote.create(:link_id => link.id)
    vote1 = Vote.create(:link_id => link.id)
    vote2 = Vote.create(:link_id => link.id)
    vote3 = Vote.create(:link_id => link.id)
    vote4 = Vote.create(:link_id => link.id)
    fifteen_minutes_from_now = DateTime.now + 15.minutes
    DateTime.stub(:now).and_return(fifteen_minutes_from_now)
    link.points.should eq 5
  end
end