require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w(draft published)) }
    it { should have_many(:comments).dependent(:destroy) }
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

    it "has a post_time method that formats dates" do
      post = create(:post)
      formatted_time = post.updated_at.strftime("%b %e, %l:%M %p")
      expect(post.post_time).to eq(formatted_time)
    end
  end

  describe "scopes" do
    it "has a scope to pull only draft posts" do
      create_list(:post, 3, status: "draft")
      create(:post, status: "published")
      expect(Post.drafts.count).to eq(3)
    end

    it "has a scope to pull only published posts" do
      create_list(:post, 3, status: "published")
      create(:post, status: "draft")
      expect(Post.published.count).to eq(3)
    end
  end
end
