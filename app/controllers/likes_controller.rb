class LikesController < ApplicationController
  before_action :which_post

  def update
    unless @post.user_likes.include?(current_user)
      @post.user_likes << current_user
    end
    redirect_to(:back)
  end

  def destroy
    @like = Like.find_by_id(params[:id])
    @like.delete
    redirect_to(:back)
  end


  private

    def which_post
      @post = Post.find_by_id(params[:id])
    end

end
