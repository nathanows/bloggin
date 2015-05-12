require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
    it { should belong_to(:post) }
  end

  describe "helpers" do
    it "has a post_time method that formats dates" do
      comment = create(:comment)
      formatted_time = comment.updated_at.strftime("%b %e, %l:%M %p")
      expect(comment.post_time).to eq(formatted_time)
    end
  end
end
