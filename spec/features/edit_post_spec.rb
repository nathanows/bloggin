require 'rails_helper'

RSpec.describe "Post Edit", type: :feature do
  describe "Editing a Post" do
    it "can edit an existing post" do
      create(:post, title: "Original Title")
      visit root_path
      click_link_or_button "Edit"
      fill_in "post[title]", with: "New Title"
      click_link_or_button "Submit"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("New Title")
    end

    it "rerenders the edit page for an invalid submission" do
      create(:post, title: "Original Title")
      visit root_path
      click_link_or_button "Edit"
      fill_in "post[title]", with: ""
      click_link_or_button "Submit"
      expect(page).to have_content("Edit Post")
    end
  end
end
