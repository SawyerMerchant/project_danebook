module PostsHelper
  def delete_post_link(post)
    text = link_to 'Delete', user_post_path(current_user, post), class: "btn btn-link delete-button", method: :delete
    text.html_safe
  end
end
