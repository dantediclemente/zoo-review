require 'coveralls'
Coveralls.wear!('rails')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def log_in_user
  visit root_path
  click_link "Sign In"
  click_link "Sign up"

  fill_in 'Email', with: "test@gmail.com"
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"

  click_button "Sign up"
end
