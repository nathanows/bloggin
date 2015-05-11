require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "posts#index" do
    it "is a valid path" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "posts#show" do
    it "is a valid path" do
      test_post = create(:post)
      get :show, id: test_post.id
      expect(response).to have_http_status(200)
    end
  end
end
