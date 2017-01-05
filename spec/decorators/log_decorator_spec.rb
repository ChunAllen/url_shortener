require 'rails_helper'

RSpec.describe LogDecorator, type: :decorator do

  let!(:log) { create(:log) }

  subject(:decorator) { described_class.new(log) }

  describe '#address' do
    it { expect(decorator.address).not_to be_nil }
  end

  describe '#accessed_on' do
    it { expect(decorator.accessed_on).to eq(log.created_at.strftime('%A, %d %b %Y %l:%M %p')) }
  end

end
