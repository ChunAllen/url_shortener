FactoryGirl.define do
  factory :url do
    given_url 'https://github.com'
    clicks 0

    trait :invalid do
      given_url nil
    end
  end
end
