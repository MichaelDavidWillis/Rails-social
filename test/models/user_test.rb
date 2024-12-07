require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save a user without having a first name" do
    user = User.new
    user.second_name = "eg"
    user.email = "foo@bar.com"
    user.image.attach(get_test_image)
    assert_not user.save
  end

  test "should not save a user without having a second name" do
    user = User.new
    user.first_name = "example"
    user.email = "foo@bar.com"
    user.image.attach(get_test_image)
    assert_not user.save
  end

  test "should not save a user without having a email" do
    user = User.new
    user.first_name = "example"
    user.second_name = "eg"
    user.image.attach(get_test_image)
    assert_not user.save
  end

  test "should not save a user without having a valid email over 6 characters in length" do
    user = User.new
    user.first_name = "example"
    user.second_name = "eg"
    user.email = "a@b"
    user.image.attach(get_test_image)
    assert_not user.save
  end

  test "should save a user with correct necessary data" do
    user = get_new_user_not_saved
    assert user.save
  end

  test "should save with image attached" do
    user = get_new_user_not_saved
    assert user.save
    assert user.image.attached?
  end
end
