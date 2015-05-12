class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to redirect_url(@post)
    else
      render :edit
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
    post.status == "draft" ? draft_posts_path : root_path
  end
end
