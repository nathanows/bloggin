require 'rails_helper'

RSpec.describe DraftPostsController, type: :controller do
  describe "DraftPosts#index" do
    it "is a valid path" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
