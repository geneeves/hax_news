require 'spec_helper'
require 'factory_girl'

describe Link do

  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:short_description) }
  it { should ensure_length_of(:short_description).
    is_at_most(50).
    with_long_message("Tighten that description up a bit. Maximum 50 characters.") }
  it { should have_many(:votes) }
  it { should have_many(:comments) }

  it "makes an array of links ordered by the number of points it has" do
    link1 = Link.create(:short_description => 'fake description', :url => "http://fake.net")
    # link1 = FactoryGirl.create(:link)
    link2 = Link.create(:short_description => 'fake description2', :url => "http://fake2.net")
    link3 = Link.create(:short_description => 'fake description3', :url => "http://fake.net3")
    1.times { Vote.create(:link_id => link1.id) }
    2.times { Vote.create(:link_id => link2.id) }
    4.times { Vote.create(:link_id => link3.id) }

    # winning_link = FactoryGirl.create(:link)
    # 8.times { FactoryGirl.create(:vote, :link => winning_link) }

    sixteen_minutes_from_now = DateTime.now + 16.minutes
    DateTime.stub(:now).and_return(sixteen_minutes_from_now)
    Link.order_by_points.should eq [link3, link2, link1]
  end

  it "get 1 point for every vote" do
    link = Link.create(:short_description => 'loser', :url => "http://losepoints.com")
    2.times { Vote.create(:link_id => link.id) }
    link.points.should eq 2
  end

  it "loses half its points every fifteen minutes" do
    link = Link.create(:short_description => 'loser', :url => "http://losepoints.com")
    8.times { Vote.create(:link_id => link.id) }
    sixteen_minutes_from_now = DateTime.now + 16.minutes
    DateTime.stub(:now).and_return(sixteen_minutes_from_now)
    link.points.should eq 4
  end

end