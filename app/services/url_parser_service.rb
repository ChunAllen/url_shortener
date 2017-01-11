class UrlParserService < BaseService

  attr_reader :url, :location

  def initialize(url, location)
    @url = url
    @location = location
  end

  def run
    url.transaction do
      Url.increment_counter :clicks, url.id
      url.logs.create!(latitude: location.latitude, longitude: location.longitude)
    end
  end

end
