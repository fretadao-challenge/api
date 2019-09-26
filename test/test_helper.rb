ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "mocha/minitest"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def mocks_spyder
    expected_return = {
      username: "my-twitter-username",
      description: "My Twitter Description"
    }
    spyder = mock('Spyder')
    spyder.stubs(:parse).returns(expected_return)
    Spyder.stubs(:new).returns(spyder)
  end
  # Add more helper methods to be used by all tests here...
end
