require "shortener"

class UrlShortener
  include Rails.application.routes.url_helpers
  include Shortener::ShortenerHelper

  def initialize
    if Rails.env.production?
      @host = "https://fretadao-api.herokuapp.com/"
    else
      @host = ENV["HOST"] || "localhost:3000"
    end
  end

  def shorten_url(some_url)
    short_url(some_url, url_options: { host: @host })
  end
end
