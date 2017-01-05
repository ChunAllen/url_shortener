class UrlsController < ApplicationController

	before_action :prepare_url, only: :show

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

	def show
		@service = UrlParser.new(@url)
		redirect_to @url.given_url if @service.run
	end

	private

	def url_params
		params.require(:url).permit(:given_url)
	end

	def prepare_url
		@url = Url.find_by_slug(params[:slug])
	end

end
