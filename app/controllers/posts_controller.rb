class PostsController < ApplicationController

  # before_action :require_current_user, only: [:new, :create, :delete]
  before_action :confirm_current_user

  def index
    @user = User.find(params[:user_id])
    @post = Post.new
    @posts = current_user.posts.order("created_at desc")
  end

  def new
    @post = current_user.posts.new
  end

  def create
    fail
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "You created a post"
      redirect_to user_posts_path
    else
      flash.now[:error] = "Post failed to save"
      render user_posts_path
    end
  end

  def show
  end

  def delete

  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

end
