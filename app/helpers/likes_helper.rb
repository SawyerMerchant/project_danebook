module LikesHelper

  def like_links(post)
    if post.user_likes.include?(current_user)
      link_to "Unlike", like_path(post.likes.where(:user_id == current_user.id).first.id), method: :delete, class: "btn btn-link like-button"
    else
      link_to "Like", like_path(post), method: :put, class: "btn btn-link like-button"
    end
  end

  def like_count(post)
    post.user_likes.count
  end

  # first three people who like a post
  # currently outputs a mess
  def who_likes(post)
    links = []
    post.user_likes.limit(3).each do |u|
      links << "<%= link_to u.profile.full_name, user_path(u), class: 'btn btn-link like-button' %>"
    end
    links
  end

  def signed_in_user_likes(post)
    if post.user_likes.include?(current_user)
      "You"
    end
  end

  def like_by(post)
    unless post.user_likes.empty?
      render partial: 'shared/liked_by', locals: {post: post}
    end
  end

  def other_likes(post)

  end

end


#TODO finish logic for rendering who likes a post
# empty: nothing
# signed_in_user: "you like this"
# < 3, names of each
# > 3, names of each plus count of remainder


# Like.where(user_id: 16, post_id: 50)
