require 'rails_helper'
feature "user signs up" do
  scenario "user signs up successfully" do

    visit root_path
    click_link "Sign In"
    click_link "Sign up"

    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user leaves blank fields" do

    visit root_path
    click_link "Sign In"
    click_link "Sign up"

    click_button "Sign up"
    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Sign Out"
  end

  scenario "user passwords don't match" do

    visit root_path
    click_link "Sign In"
    click_link "Sign up"

    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password1"

    click_button "Sign up"
    expect(page).to have_content "doesn't match"
    expect(page).to_not have_content "Sign Out"
  end
end
