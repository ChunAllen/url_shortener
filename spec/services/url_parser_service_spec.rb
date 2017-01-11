require 'rails_helper'

RSpec.describe UrlParserService, type: :service do

  let!(:url) { create(:url) }
  let(:log) { build(:log, url: url) }

  let(:location) { OpenStruct.new(latitude: log.latitude, longitude: log.longitude) }

  let(:service) { described_class.new(url, location) }

  describe '.url' do
    it { expect(service.url).to eq(url) }
  end

  describe '.location' do
    it { expect(service.location).not_to be_nil }
  end

  describe '#run' do
    it { expect { service.run }.to change { url.reload.clicks }.from(0).to(1) }

    it { expect { service.run }.to change { url.logs.count }.from(0).to(1) }

    it { expect(service.run).to be_truthy }
  end

end
