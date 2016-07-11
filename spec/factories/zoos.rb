FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testemail#{n}@hotmail.com" }
    password "123456"
  end

  factory :zoo do
    association :user
    sequence(:name) { |n| "Zoo #{n}" }
    sequence(:address) { |n| "Address #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:zip) { |n| "1111#{n}" }
  end
end
