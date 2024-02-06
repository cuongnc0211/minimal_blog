class PostsController < ApplicationController
  def index
    return if Post.published.empty?

    @highlighted_posts = Post.published.priority.newest.first.presence || Post.published.newest.first

    @pagy, @posts = pagy(Post.published.except_post(@highlighted_posts))
  end

  def show
    @post = Post.published.friendly.find(params[:id])
  end
end
