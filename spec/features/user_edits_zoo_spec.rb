require 'rails_helper'
feature "user edits zoo" do
  scenario "user adds a zoo successfully and edits successfully" do
    create_zoo
    click_link "Edit Zoo"
    expect(page).to have_content "Edit Zoo"
    fill_in 'Name', with: "Franklin Park Zoo"
    fill_in 'Address', with: "105 Bleach St"
    fill_in 'City', with: "Burlington"
    fill_in 'State', with: "Vermont"
    fill_in 'Zip', with: "02894"
    click_button "Update Zoo"
    expect(page).to have_content "Zoo updated successfully"
    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "Burlington"
    expect(page).to have_content "Vermont"
  end
  scenario "user adds a zoo successfully and edits unsuccessfully" do
    create_zoo
    click_link "Edit Zoo"
    expect(page).to have_content "Edit Zoo"
    fill_in 'Name', with: ""
    fill_in 'Address', with: ""
    fill_in 'City', with: ""
    fill_in 'State', with: ""
    fill_in 'Zip', with: ""
    click_button "Update Zoo"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
  scenario "user that didn't create zoo can't edit zoo" do
    create_zoo
    sign_out
    sign_in_as_dummy
    visit root_path
    click_link "Franklin Park Zoo"
    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "Boston"
    expect(page).to_not have_content "Edit Zoo"
  end
end
