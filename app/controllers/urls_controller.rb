class UrlsController < ApplicationController

  def index
    @urls = UrlDecorator.wrap_all(Url.all)
  end

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(url_params)
		if @url.save
			flash[:notice] = 'New URL has been shortened'
		else
			flash[:error] = @url.errors.full_messages.to_sentence
		end
	end

	private

	def url_params
		params.require(:url).permit(:given_url)
	end

end
