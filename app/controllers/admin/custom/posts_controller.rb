class Admin::Custom::PostsController < Admin::BaseController
  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post created successfully"
      redirect_to admin_post_path(post)
    else
      flash.now[:error] = "Post could not be created"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Post updated successfully"
      redirect_to admin_post_path(post)
    else
      flash.now[:error] = "Post could not be updated"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :status, :is_priority, :content)
  end
end