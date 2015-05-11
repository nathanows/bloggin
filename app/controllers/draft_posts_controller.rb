class DraftPostsController < ApplicationController
  def index
    @posts = Post.drafts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attribute(:status, "published")
    redirect_to root_path
  end
end
