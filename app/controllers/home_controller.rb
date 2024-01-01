class HomeController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.published)
  end
end
