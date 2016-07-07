FactoryGirl.define do
  factory :zoos do
    sequence(:name) {|n| "Zoo #{n}" }
    sequence(:address) {|n| "Address #{n}" }
    sequence(:city) {|n| "City #{n}" }
    sequence(:state) {|n| "State #{n}" }
    sequence(:zip) {|n| "1111#{n}" }
  end
end
