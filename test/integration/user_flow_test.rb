require "test_helper"

class UserFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_response :success
    assert_select "nav.navbar"
    assert_select "link"
  end

  test "can access a user's show page" do
    test_user = get_new_user

    get "/users/#{test_user.id}"
    assert_response :success
    assert_select "h2", "This is Example's page"
  end

  test "can create a user" do
    get "/users/new", headers: http_login
    assert_response :success
    assert_select "form" do
      assert_select "label", 4
    end

    post "/users", params: get_new_user_in_json_format, headers: http_login
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "This is Example's page"
  end
end
