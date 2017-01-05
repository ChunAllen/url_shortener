class UrlParser < BaseService

  attr_reader :url, :location

  def initialize(url, location)
    @url = url
    @location = location
  end

  def run
    url.transaction do
      url.update(clicks: counter)
      url.logs.create!(latitude: location.latitude, longitude: location.longitude)
    end
  end

  private

  def counter
    url.clicks + 1
  end

end
