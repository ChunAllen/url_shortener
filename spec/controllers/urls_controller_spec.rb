require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  let!(:url) { create(:url) }

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:urls)).to include(url) }
  end

  describe 'GET #new' do
    before { get :new, xhr: true }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:url)).to be_a(Url) }
  end

  describe 'GET #show' do
    before { get :show, params: { id: url.id } }

    it { is_expected.to render_template(:show) }
  end

  describe 'GET #redirect' do
    before { get :redirect, params: { slug: url.slug } }

    it { expect(assigns(:service)).to be_a(UrlParserService) }
    it { is_expected.to redirect_to(url.given_url) }
  end

end
