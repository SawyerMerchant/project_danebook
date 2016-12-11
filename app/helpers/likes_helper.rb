module LikesHelper

  def like_links(post)
    if post.user_likes.include?(current_user)
      link_to "Unlike", like_path(post.likes.where(:user_id == current_user.id).first.id), method: :delete, class: "btn btn-link like-button"
    else
      link_to "Like", like_path(post), method: :put, class: "btn btn-link like-button"
    end
  end
end


# Like.where(user_id: 16, post_id: 50)
