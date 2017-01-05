class UrlParser < BaseService

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def run
    url.update(clicks: url.clicks + 1)
  end

end
