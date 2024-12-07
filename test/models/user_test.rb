require "test_helper"

class UserTest < ActiveSupport::TestCase
  test_image = { io: File.open(Rails.root.join("test/fixtures/files/test.png")), filename: "test.png", content_type: "image/png" }

  test "should not save a user without having a first name" do
    user = User.new
    user.second_name = "eg"
    user.email = "foo@bar.com"
    user.image.attach(test_image)
    assert_not user.save
  end

  test "should save a user with correct necessary data" do
    user = User.new
    user.first_name = "Example"
    user.second_name = "eg"
    user.email = "foo@bar.com"
    user.image.attach(test_image)
    assert user.save
  end
end
