ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def get_test_image
      { io: File.open(Rails.root.join("test/fixtures/files/test.png")), filename: "test.png", content_type: "image/png" }
    end

    def get_new_user_not_saved
      test_user = User.new
      test_user.first_name = "Example"
      test_user.second_name = "eg"
      test_user.email = "foo@bar.com"
      test_user.image.attach(get_test_image)
      test_user
    end

    def get_new_user
      test_user = User.new
      test_user.first_name = "Example"
      test_user.second_name = "eg"
      test_user.email = "foo@bar.com"
      test_user.image.attach(get_test_image)
      test_user.save
      test_user
    end
  end
end
