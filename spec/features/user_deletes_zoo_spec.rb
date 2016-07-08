require 'rails_helper'
feature "user edits zoo" do
  scenario "user adds a zoo successfully and deletes successfully" do
    create_zoo
    click_link "Delete Zoo"
    expect(page).to have_content "Zoo deleted successfully"
    expect(page).to have_content "Zoos"
  end
  scenario "user that didn't create zoo can't delete zoo" do
    create_zoo
    sign_out
    sign_in_as_dummy
    visit root_path
    click_link "Franklin Park Zoo"
    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "Boston"
    expect(page).to_not have_content "Delete Zoo"
  end
end
