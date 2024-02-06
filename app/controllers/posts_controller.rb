class PostsController < ApplicationController
  def index
    return if Post.published.empty?

    @highlighted_posts = Post.published.priority.newest.first.presence || Post.published.newest.first

    @pagy, @posts = pagy(Post.published, items: 1)
    # @pagy, @posts = pagy(Post.published.except_post(@highlighted_posts), items: 1)
  end

  def show
    @post = Post.published.friendly.find(params[:id])
  end
end
