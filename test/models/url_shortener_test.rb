require "test_helper"

class UrlShortenerTest < ActiveSupport::TestCase
  setup do
    @url = "https://twitter.com/usefretadao"
  end

  test "should shorten URL" do
    shortener = UrlShortener.new
    shortened_url = shortener.shorten_url(@url)

    assert_not_nil shortened_url
    assert_match "localhost:3000", shortened_url
  end

  test "should redirect to correct API url" do
    Rails.env.expects(:production?).returns(true)
    shortener = UrlShortener.new

    assert "https://fretadao-api.herokuapp.com/", shortener.host
  end
end
