class LogDecorator < BaseDecorator

	def address
		geolocation.try(:address)
	end

  def accessed_on
    created_at.strftime('%A, %d %b %Y %l:%M %p')
  end

	private

  def geolocation
    Geocoder.search("#{latitude}, #{longitude}").first
  end

end
