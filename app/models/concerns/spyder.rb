require 'nokogiri'
require 'open-uri'

class Spyder

  def initialize(http_address)
    @document = Nokogiri::HTML(open(http_address))
  end

  def parse
    profile = {
                username: parse_username,
                description: parse_description
              }
    profile
  end

  private

  def parse_username
    @document.css('.ProfileHeaderCard-screennameLink.u-linkComplex.js-nav
                                     .username.u-dir b.u-linkComplex-target').text
  end

  def parse_description
    @document.css('.ProfileHeaderCard-bio.u-dir').text
  end
end
