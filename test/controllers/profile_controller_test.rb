require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    mocks_spyder
    @profile = profiles(:one)
    @another_profile = profiles(:two)
  end

  test "should get profiles index" do
    get profiles_url, as: :json
    assert_response :success
  end

  test "should create profile" do
    assert_difference("Profile.count") do
      post profiles_url, params: {
        profile: {
          name: @profile.name,
          twitter_url: @profile.twitter_url
        }
      }, as: :json
    end

    assert_response :created
  end

  test "should not accept profile without name" do
    assert_no_difference("Profile.count") do
      post profiles_url, params: {
        profile: {
          twitter_url: @profile.twitter_url
        }
      }, as: :json
    end
    assert_response :unprocessable_entity

    patch profile_url(@profile), params: {
      profile: { name: "" }
    }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not accept profile without twitter_url" do
    assert_no_difference("Profile.count") do
      post profiles_url, params: {
        profile: {
          name: "Some name"
        }
      }, as: :json
    end
    assert_response :unprocessable_entity

    patch profile_url(@profile), params: {
      profile: { twitter_url: "" }
    }, as: :json
    assert_response :unprocessable_entity
  end

  test "should show profile" do
    get profile_url(@profile), as: :json
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: {
      profile: {
        name: "My Profile",
        twitter_url: "twitter.com/asdf"
      }
    }, as: :json
    assert_response :ok
  end

  test "should destroy profile" do
    assert_difference("Profile.count", -1) do
      delete profile_url(@profile), as: :json
    end

    assert_response :no_content
  end
end
