require 'rails_helper'

RSpec.describe UrlDecorator, type: :decorator do

  let!(:url) { create(:url) }

  subject(:decorator) { described_class.new(url) }

  describe '#shortened_url' do
    it { expect(decorator.shortened_url).to eq("http://short.ly/#{url.slug}") }
  end

end
