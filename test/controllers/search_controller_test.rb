require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    mocks_spyder
    @profile = profiles(:one)
    @profile.save
    @another_profile = profiles(:two)
    @another_profile.save
  end

  test "should search profile by name" do
    get "/search", params: {
      query: "Profile Silva"
    }
    assert_response :ok

    hashed_search_result = JSON.parse(response.body).first
    assert_equal "Profile Silva", hashed_search_result["name"]
  end

  test "should search profile by username" do
    get "/search", params: {
      query: "my-twitter-username"
    }
    assert_response :ok

    hashed_search_result = JSON.parse(response.body).first
    assert_equal "my-twitter-username", hashed_search_result["username"]
  end

  test "should search profile by description" do
    get "/search", params: {
      query: "My Twitter Description"
    }
    assert_response :ok

    hashed_search_result = JSON.parse(response.body).first
    assert_equal "My Twitter Description", hashed_search_result["description"]
  end
end
