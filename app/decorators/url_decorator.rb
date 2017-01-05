class UrlDecorator < BaseDecorator

  def shortened_url
    "#{ENV['BASE_URL']}#{slug}"
  end

end
