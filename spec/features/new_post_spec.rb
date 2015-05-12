require 'rails_helper'

RSpec.describe "Post Creation", type: :feature do
  describe "Creating a Post" do
    it "can create a post and redirect to drafts if draft post" do
      visit new_post_path
      fill_in "post[title]", with: "Test Post"
      fill_in "post[author]", with: "The Author"
      select "Draft", :from => "post[status]"
      fill_in "post[body]", with: "Some post body content"
      click_link_or_button "Submit"
      expect(current_path).to eq(draft_posts_path)
      expect(page).to have_content("Test Post")
    end

    it "can create a post and redirect to posts if published post" do
      visit new_post_path
      fill_in "post[title]", with: "Test Post"
      fill_in "post[author]", with: "The Author"
      select "Published", :from => "post[status]"
      fill_in "post[body]", with: "Some post body content"
      click_link_or_button "Submit"
      expect(current_path).to eq(posts_path)
      expect(page).to have_content("Test Post")
    end

    it "rerenders the new page for an invalid submission" do
      visit new_post_path
      fill_in "post[title]", with: "Test Post"
      select "Published", :from => "post[status]"
      fill_in "post[body]", with: "Some post body content"
      click_link_or_button "Submit"
      expect(page).to have_content("Create New Post:")
    end
  end
end
