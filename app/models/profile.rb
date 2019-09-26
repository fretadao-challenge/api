class Profile < ApplicationRecord
  has_shortened_urls

  validates :name, presence: true
  validates :twitter_url, presence: true

  before_save :smart_add_url_protocol, :twitter_fetch, :shorten_twitter_url

  def twitter_fetch
    info = Spyder.new(self.twitter_url)
    parsed_info = info.parse
    self.username = parsed_info[:username]
    self.description = parsed_info[:description]
  end

  def shorten_twitter_url
    shortener = UrlShortener.new
    new_shortened_url = shortener.shorten_url(self.twitter_url)
    self.shortened_url = new_shortened_url
  end

  protected

  def smart_add_url_protocol
    if self.twitter_url && !url_protocol_present?
      self.twitter_url = "http://#{self.twitter_url}"
    end
  end

  def url_protocol_present?
    self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
  end

end
