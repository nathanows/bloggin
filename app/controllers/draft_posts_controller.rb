class DraftPostsController < ApplicationController
  def index
    @posts = Post.drafts
    @tags  = Post.draft_tags
  end

  def create
    @post = Post.find(params[:post_id])
    @post.update_attribute(:status, "draft")
    redirect_to draft_posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attribute(:status, "published")
    redirect_to root_path
  end
end
