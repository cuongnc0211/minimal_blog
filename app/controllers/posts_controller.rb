class PostsController < ApplicationController
  def show
    @post = Post.published.find(params[:id])
  end
end
