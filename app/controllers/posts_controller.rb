class PostsController < ApplicationController

  # before_action :require_current_user, only: [:new, :create, :delete]
  # before_action :require_ownership, only: [:new, :create, :delete, :update]

  def index
    @user = User.find(params[:user_id])
    @post = Post.new
    @posts = @user.posts.order("created_at desc")
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
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

  def destroy
    #can still delete other users's posts
    Post.find_by_id(params[:id]).destroy
    redirect_to user_posts_path
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

    def require_ownership
      unless Post.find_by_id(params[:id]).user == current_user
      # unless params[:user_id] == current_user.id.to_s
        flash[:error] = "You can't do that!"
        redirect_to user_posts_path
      end
    end

end
