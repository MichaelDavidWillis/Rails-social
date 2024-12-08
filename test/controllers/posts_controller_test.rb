require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should post to create" do
    post user_posts_path(posts(:one)), params: get_new_post_in_json_format

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should delete destroy" do
    post = posts(:one)

    assert_difference("Post.count", -1) do
      delete user_post_path(post.user_id, post.id), headers: http_login
    end

    assert_redirected_to user_path post.user_id
  end
end
