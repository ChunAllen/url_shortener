class UrlDecorator < BaseDecorator

  PROTOCOLS = %w( http https ).freeze

  def shortened_url
    "#{ENV['BASE_URL']}#{slug}"
  end

  # added a guard clause that returns given_url if protocols is present
  # otherwise it creates new string contcatenated with http
  def formatted_url
    return model.given_url if protocol_exists?
    "#{PROTOCOLS.first}://#{model.given_url}"
  end

  private

  # Checks if the given_url has http or https
  def protocol_exists?
    uri = URI.parse(model.given_url)
    PROTOCOLS.include?(uri.scheme)
  end

end
