require 'rails_helper'

RSpec.describe "Post Page", type: :feature do
  describe "Basic Routing" do
    it "post_path routes to the Post page" do
      test_post = create(:post)
      visit post_path(test_post)
      expect(page).to have_content(test_post.title)
    end
  end

  describe "Post Show" do
    it "displays a post with markdown" do
      test_post = create(:post,
        body: %Q{####Test Title

        And body},
        status: "published")
      visit post_path(test_post)
      within('h4') do
        expect(page).to have_content("Test Title")
      end
    end

    it "displays a draft banner for draft posts" do
      test_post = create(:post,
        body: %Q{###Test Title

        And body},
        status: "draft")
      visit post_path(test_post)
      within('.banner') do
        expect(page).to have_content("Draft Post")
      end
    end

    it "displays a show banner for published posts" do
      test_post = create(:post,
        body: %Q{###Test Title

        And body},
        status: "published")
      visit post_path(test_post)
      within('.banner') do
        expect(page).to have_content("Published Post")
      end
    end
  end

  describe "Post Comments" do
    it "displays all post comments" do
      test_post = create(:post)
      test_post.comments << create(:comment, body: "This is a comment.")
      visit post_path(test_post)
      expect(page).to have_content("This is a comment")
    end

    it "displays a message that there are no comments" do
      test_post = create(:post)
      visit post_path(test_post)
      expect(page).to have_content("No comments for this post.")
    end

    it "can create new comments" do
      test_post = create(:post)
      visit post_path(test_post)
      fill_in "comment[author]", with: "Person"
      fill_in "comment[body]", with: "Comment body."
      click_link_or_button "Submit"
      expect(page).to have_content("Comment body.")
    end

    it "can delete comments" do
      test_post = create(:post)
      test_post.comments << create(:comment, body: "This is a comment.")
      visit post_path(test_post)
      within(".comment") do
        click_link_or_button "Delete"
      end
      expect(page).to_not have_content("This is a comment.")
    end
  end
end
