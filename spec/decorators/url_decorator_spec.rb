require 'rails_helper'

RSpec.describe UrlDecorator, type: :decorator do

  let!(:url) { create(:url) }

  subject(:decorator) { described_class.new(url) }

  describe '#shortened_url' do
    it { expect(decorator.shortened_url).to eq("http://short.ly/#{url.slug}") }
  end

  describe '#formatted_url' do
    context 'when given_url has http or https' do
      let(:url) { create(:url, given_url: 'http://google.com') }

      it { expect(decorator.formatted_url).to eq(url.given_url) }
    end

    context "when given_url doesn't have http or https" do
      let(:url) { create(:url, given_url: 'google.com') }

      it { expect(decorator.formatted_url).not_to eq(url.given_url) }
      it { expect(decorator.formatted_url).to eq("#{UrlDecorator::PROTOCOLS[0]}://#{url.given_url}") }
    end
  end

end
