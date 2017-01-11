class UrlsController < ApplicationController

  before_action :prepare_url, only: :show
  before_action :prepare_slug, only: :redirect

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

  def show; end

  def redirect
    @service = UrlParserService.new(@url, request.location)
    redirect_to @url.formatted_url if @service.run
  end

  private

  def url_params
    params.require(:url).permit(:given_url)
  end

  def prepare_url
    @url = UrlDecorator.new(Url.find(params[:id]))
  end

  def prepare_slug
    @url = UrlDecorator.new(Url.find_by_slug(params[:slug]))
  end

end
