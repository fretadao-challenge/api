require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  setup do
    mocks_spyder
    @profile = profiles(:one)
  end

  test "should save valid profile" do
    # FIMXE: Stub twitter url
    new_profile = Profile.new(name: "Some Profile", twitter_url: "twitter.com/asdf")

    assert new_profile.save
  end

  test "should not save profile without name" do
    invalid_profile = Profile.new(twitter_url: "twitter.com/john-doe")
    refute invalid_profile.save
  end

  test "should not save profile without twitter url" do
    invalid_profile = Profile.new(name: "John Doe")
    refute invalid_profile.save
  end

  test "should update profile name" do
    @profile.name = "New Name"
    assert @profile.save
  end

  test "should delete profile" do
    deletable_profile = profiles(:two)
    deletable_profile.save

    assert deletable_profile.destroy
  end
end
