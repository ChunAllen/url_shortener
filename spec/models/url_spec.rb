require 'rails_helper'

RSpec.describe Url, type: :model do

  it { is_expected.to validate_presence_of(:given_url) }

  it { is_expected.to validate_uniqueness_of(:slug) }

  it { is_expected.to have_many(:logs).inverse_of(:url).dependent(:destroy) }

end
