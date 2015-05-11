require 'rails_helper'

RSpec.describe "All Draft Posts Page", type: :feature do
  describe "Basic Routing" do
    it "posts_path routes to the All Posts page" do
      visit draft_posts_path
      expect(page).to have_content("All Posts")
    end
  end

  describe "Draft Post Listing" do
    it "displays only draft posts" do
      post1 = create(:post, title: "First Post", status: "draft")
      post2 = create(:post, title: "Second Post", status: "draft")
      post3 = create(:post, title: "Third Post", status: "published")
      visit draft_posts_path
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to_not have_content(post3.title)
    end
  end

  describe "Draft Post Publication" do
    it "publishes a post when the Publish button is pressed" do
      post1 = create(:post, title: "Test Draft Post", status: "draft")
      visit draft_posts_path
      click_link_or_button "Publish"
      expect(page).to have_content(post1.title)
      visit draft_posts_path
      expect(page).to_not have_content(post1.title)
    end
  end
end
