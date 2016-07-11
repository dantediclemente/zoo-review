require 'rails_helper'
feature "user deletes review" do
  before(:each) do
    create_zoo
    write_review
  end

  scenario "user adds a review successfully and deletes successfully" do
    click_link "Delete Review"
    expect(page).to have_content "Review deleted successfully"
    expect(page).to have_content "Franklin Park Zoo"
  end

  scenario "user that didn't create review can't delete review" do
    sign_out
    sign_in_as_dummy
    visit root_path
    click_link "Franklin Park Zoo"

    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "Boston"
    expect(page).to_not have_content "Delete Review"
  end
end
