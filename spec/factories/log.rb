FactoryGirl.define do
  factory :log do
    association :url, factory: :url, strategy: :build

    latitude 5.4889
    longitude 120.5986
  end
end
