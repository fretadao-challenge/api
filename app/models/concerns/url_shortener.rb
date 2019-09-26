require "shortener"

class UrlShortener
  include Rails.application.routes.url_helpers
  include Shortener::ShortenerHelper

  def initialize
    @host = ENV["HOST"] || "localhost:3000"
  end

  def shorten_url(some_url)
    short_url(some_url, url_options: { host: @host })
  end
end
