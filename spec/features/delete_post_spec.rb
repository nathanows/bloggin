require 'rails_helper'

RSpec.describe "Post Deletion", type: :feature do
  describe "Deleting a Post" do
    it "can delete a post from all posts" do
      delete_post = create(:post, status: "published")
      visit root_path
      click_link_or_button "Delete"
      expect(page).to_not have_content(delete_post.title)
    end

    it "can delete a post from draft posts" do
      delete_post = create(:post, status: "draft")
      visit draft_posts_path
      click_link_or_button "Delete"
      expect(page).to_not have_content(delete_post.title)
    end

    it "can delete a post from the show page if a draft post" do
      delete_post = create(:post, status: "draft")
      visit post_path(delete_post)
      click_link_or_button "Delete"
      expect(page).to_not have_content(delete_post.title)
    end
  end
end
