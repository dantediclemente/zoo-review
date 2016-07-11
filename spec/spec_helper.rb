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

def sign_out
  click_link "Sign Out"
end

def sign_in_as_dummy
  visit root_path
  click_link "Sign In"
  click_link "Sign up"

  fill_in 'Email', with: "seconduser@gmail.com"
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"

  click_button "Sign up"
end

def create_zoo
  log_in_user
  visit new_zoo_path
  expect(page).to have_content "New Zoo Form"
  fill_in 'Name', with: "Franklin Park Zoo"
  fill_in 'Address', with: "105 Beach St"
  fill_in 'City', with: "Boston"
  select "Massachusetts", from: "State"
  fill_in 'Zip', with: "02111"
  click_button "Add Zoo"
end

def write_review
  visit root_path
  click_link "Franklin Park Zoo"
  fill_in 'Comment', with: "This zoo is awesome!"
  choose(5)
  click_button "Add Review"
end
