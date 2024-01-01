class PostsController < ApplicationController
  def show
    @post = Post.published.friendly.find(params[:id])
  end
end
