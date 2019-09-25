class Profile < ApplicationRecord
  validates :name, presence: true
  validates :twitter_url, presence: true

  before_save :twitter_fetch, :smart_add_url_protocol

  def twitter_fetch
    info = Spyder.new(self.twitter_url)
    parsed_info = info.parse
    self.username = parsed_info[:username]
    self.description = parsed_info[:description]
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
