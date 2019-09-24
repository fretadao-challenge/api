require 'nokogiri'
require 'open-uri'

module Spyder
  def self.parse
    document = Nokogiri::HTML(open('https://www.twitter.com/neymarjr'))

    profile_username = document.css('.ProfileHeaderCard-screennameLink.u-linkComplex.js-nav
                                     .username.u-dir b.u-linkComplex-target').text
    profile_description = document.css('.ProfileHeaderCard-bio.u-dir').text

  end
end
