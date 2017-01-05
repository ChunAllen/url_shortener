shared_examples 'device_hour_valuable' do
  subject(:device_hour_valuable) { described_class.new(web_amount: 1, ios_amount: 1, android_amount: 1, design_amount: 1) }

  describe '#web_amount' do
    it { expect(device_hour_valuable.web_amount).to be_a(Hour) }
  end

  describe '#ios_amount' do
    it { expect(device_hour_valuable.ios_amount).to be_a(Hour) }
  end

  describe '#android_amount' do
    it { expect(device_hour_valuable.android_amount).to be_a(Hour) }
  end

  describe '#design_amount' do
    it { expect(device_hour_valuable.design_amount).to be_a(Hour) }
  end

  describe '#device_amounts?' do
    context 'with_amounts' do
      it { expect(device_hour_valuable.device_amounts?).to eq(true) }
    end

    context 'without_amounts' do
      subject(:device_hour_valuable) { described_class.new }

      it { expect(device_hour_valuable.device_amounts?).to eq(false) }
    end
  end

  describe '#total_amount_across_devices?' do
    it { expect(device_hour_valuable.total_amount_across_devices.to_f).to eq(4.0) }
  end
end
