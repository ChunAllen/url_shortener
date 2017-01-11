class UrlParserService < BaseService

  attr_reader :url, :location

  def initialize(url, location)
    @url = url
    @location = location
  end

  # Increments clicks using Atomic Incrementor
  # http://www.alfreddd.com/2011/01/atomic-increment-in-rails.html
  def run
    url.transaction do
      Url.increment_counter(:clicks, url.id)
      url.logs.create!(latitude: location.latitude, longitude: location.longitude)
    end
  end

end
