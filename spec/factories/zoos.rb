FactoryGirl.define do
  factory :zoo do
    sequence(:user_id) { |n| "00#{n}" }
    sequence(:name) { |n| "Zoo #{n}" }
    sequence(:address) { |n| "Address #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:zip) { |n| "1111#{n}" }
  end
end
