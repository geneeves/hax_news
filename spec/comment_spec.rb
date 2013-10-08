require 'spec_helper'

describe Comment do
  it { should belong_to(:commentable) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:comment_text) }

  it "tells you what the original link on this comment was" do
    link = Link.create(:url => "http://www.learnhowtoprogram.com", :short_description => "Epicodus")
    comment1 = link.comments.create(:comment_text => "Ha!", :commentable_id => link.id, :commentable_type => Link)
    comment2 = comment1.comments.create(:comment_text => "Super ha", :commentable_id => comment1.id, :commentable_type => Comment)
    comment2.link.should eq link
  end
end