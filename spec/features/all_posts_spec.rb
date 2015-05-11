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
end
