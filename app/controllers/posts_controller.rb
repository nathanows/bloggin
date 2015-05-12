class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to redirect_url(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to redirect_url(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :status)
  end

  def redirect_url(post)
    post.status == "draft" ? draft_posts_path : posts_path
  end
end
