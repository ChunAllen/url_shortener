class UrlDecorator < BaseDecorator

  def shortened_url
		if Rails.env == 'development'
			"http://localhost:3000/#{slug}"
		else
    	"#{ENV['BASE_URL']}#{slug}"
		end
  end

end
