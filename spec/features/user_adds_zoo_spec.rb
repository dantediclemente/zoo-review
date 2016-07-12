require 'rails_helper'
feature "visitor can add zoo" do
  scenario "user adds a zoo successfully" do
    log_in_user
    visit new_zoo_path
    expect(page).to have_content "New Zoo Form"
    fill_in 'Name', with: "Franklin Park Zoo"
    fill_in 'Address', with: "105 Beach St"
    fill_in 'City', with: "Boston"
    select "Massachusetts", from: "State"
    fill_in 'Zip', with: "02111"
    click_button "Add Zoo"
    expect(page).to have_content "Zoo added successfully"
    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "105 Beach St"
  end

  scenario "visitor does not provide proper information for a Zoo" do
    log_in_user
    visit new_zoo_path
    click_button "Add Zoo"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end

  scenario "user not signed in tries to create zoo" do
    visit new_zoo_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
