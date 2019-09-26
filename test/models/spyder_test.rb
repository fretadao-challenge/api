require "test_helper"
require "nokogiri"
require "open-uri"

class SpyderTest < ActiveSupport::TestCase
  test "should parse twitter information" do
    username_and_description_html = <<~HEREDOC
      <h2 class="ProfileHeaderCard-screenname u-inlineBlock u-dir" dir="ltr">
        <a class="ProfileHeaderCard-screennameLink u-linkComplex js-nav">
          <span class="username u-dir" dir="ltr">@<b class="u-linkComplex-target">johndoe</b></span>
        </a>
      </h2>
      <p class="ProfileHeaderCard-bio u-dir" dir="ltr">My awesome description</p>

    HEREDOC

    some_url = "https://twitter.com/usefretadao"
    OpenURI.expects(:open_uri).returns(username_and_description_html)
    spyder = Spyder.new(some_url)
    hashed_result = spyder.parse

    assert_equal "johndoe", hashed_result[:username]
    assert_equal "My awesome description", hashed_result[:description]
  end
end
