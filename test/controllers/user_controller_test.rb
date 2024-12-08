require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url, headers: http_login
    assert_response :success
  end

  test "should post to create" do
    post users_url, params: get_new_user_in_json_format, headers: http_login
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should get show" do
    get users_url, params: { id: 1 }
    assert_response :success
  end

  test "should get edit" do
    user = get_new_user
    get edit_user_url(user.id), headers: http_login
    assert_response :success
  end

  test "should patch update" do
    user = get_new_user
    patch user_url(user.id), params: { user: { first_name: "Test" } }, headers: http_login
    assert_redirected_to user_path(user)
    user.reload
    assert_equal "Test", user.first_name
  end

  test "should delete destroy" do
    user = get_new_user
    assert_difference("User.count", -1) do
      delete user_url(user.id), headers: http_login
    end

    assert_redirected_to root_path
  end
end
