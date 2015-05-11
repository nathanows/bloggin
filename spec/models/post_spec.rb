require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w(draft published)) }
  end

  describe "helpers" do
    it "has an excerpt method to return the first 50 words" do
      body = "test " * 51
      post = create(:post, body: body)
      excerpt = "test " * 50
      expect(post.excerpt).to eq(excerpt[0..-2])
    end

    it "has an excerpt method that returns the full post if < 50 words" do
      body = "test " * 10
      post = create(:post, body: body)
      excerpt = "test " * 10
      expect(post.excerpt).to eq(excerpt[0..-2])
    end
  end
end
