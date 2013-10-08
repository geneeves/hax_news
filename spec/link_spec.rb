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
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }

  it "makes an array of links ordered by the number of points it has" do
    link1 = FactoryGirl.create(:link)
    link2 = FactoryGirl.create(:link)
    link3 = FactoryGirl.create(:link)
    1.times { FactoryGirl.create(:vote, :link => link1) }
    2.times { FactoryGirl.create(:vote, :link => link2) }
    4.times { FactoryGirl.create(:vote, :link => link3) }
    sixteen_minutes_from_now = DateTime.now + 16.minutes
    DateTime.stub(:now).and_return(sixteen_minutes_from_now)
    Link.order_by_points.should eq [link3, link2, link1]
  end

  it "gets 1 point for every vote" do
    link = FactoryGirl.create(:link)
    2.times { FactoryGirl.create(:vote, :link => link) }
    link.points.should eq 2
  end

  it "loses half its points every fifteen minutes" do
    link = FactoryGirl.create(:link)
    8.times { FactoryGirl.create(:vote, :link => link) }
    sixteen_minutes_from_now = DateTime.now + 16.minutes
    DateTime.stub(:now).and_return(sixteen_minutes_from_now)
    link.points.should eq 4
  end

end