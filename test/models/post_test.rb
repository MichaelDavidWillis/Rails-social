require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not save a post without belonging to a user" do
    test_post = Post.new
    assert_not test_post.save
  end

  test "should save a post if belonging to a user" do
    test_user = get_new_user
    test_post = Post.new
    test_post.user_id = test_user.id
    assert test_post.save
  end

  test "should contain a visible status" do
    assert Post.included_modules.include?(Visible)

    test_post = Post.new
    assert_includes Visible::VALID_STATUSES, test_post.status
  end
end
