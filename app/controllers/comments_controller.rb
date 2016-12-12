class CommentsController < ApplicationController

  def create
    post = Post.find_by_id(params[:post_id])
    post.comments << Comment.create(user_id: current_user.id, body: params[:comment][:body], commentable_id: post.id, commentable_type: post.class)
    redirect_to (:back)
  end
end
