class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.published)
  end

  def show
    @post = Post.published.friendly.find(params[:id])
  end
end
