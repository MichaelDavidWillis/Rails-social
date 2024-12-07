require "test_helper"

class UserFlowTest < ActionDispatch::IntegrationTest
  http_login = {
    "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials("me", "pass")
  }
  test_user = {
    user: {
      first_name: "can",
      second_name: "create",
      email: "user@successfully",
      image: { io: File.open(Rails.root.join("test/fixtures/files/test.png")), filename: "test.png", content_type: "image/png" }
    }
  }
  test "can see the welcome page" do
    get "/"
    assert_select "nav.navbar"
    assert_select "link"
  end

  test "can create a user" do
    get "/users/new", headers: http_login
    assert_response :success

    post "/users", params: test_user, headers: http_login
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "This is can's page"
  end
end
