require 'rails_helper'

RSpec.describe "Post Page", type: :feature do
  describe "Basic Routing" do
    it "post_path routes to the Post page" do
      test_post = create(:post)
      visit post_path(test_post)
      expect(page).to have_content(test_post.title)
    end
  end

  describe "Post Listing" do
    it "displays a post with markdown" do
      test_post = create(:post,
        body: %Q{###Test Title

        And body},
        status: "published")
      visit post_path(test_post)
      within('h3') do
        expect(page).to have_content("Test Title")
      end
    end

    it "displays a draft banner for draft posts" do
      test_post = create(:post,
        body: %Q{###Test Title

        And body},
        status: "draft")
      visit post_path(test_post)
      within('.panel') do
        expect(page).to have_content("This is a draft post.")
      end
    end
  end
end
