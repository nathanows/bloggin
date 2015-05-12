require 'rails_helper'

RSpec.describe "All Posts Page", type: :feature do
  describe "Basic Routing" do
    it "posts_path routes to the All Posts page" do
      visit posts_path
      expect(page).to have_content("All Posts")
    end

    it "is aliased to the root path" do
      visit root_path
      expect(page).to have_content("All Posts")
    end
  end

  describe "Post Listing" do
    it "displays only published posts" do
      post1 = create(:post, title: "First Post", status: "published")
      post2 = create(:post, title: "Second Post", status: "published")
      post3 = create(:post, title: "Third Post", status: "draft")
      visit root_path
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to_not have_content(post3.title)
    end
  end

  describe "Published Post Unpublication" do
    it "unpublishes a post when the Unpublish button is pressed" do
      post1 = create(:post, title: "Test Draft Post", status: "published")
      visit root_path
      click_link_or_button "Unpublish"
      expect(page).to have_content(post1.title)
      visit root_path
      expect(page).to_not have_content(post1.title)
    end
  end
end
