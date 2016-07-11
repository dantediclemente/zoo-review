require 'rails_helper'
feature "visitor edits a review" do
  scenario "user edits a review for a zoo successfully" do
    create_zoo
    write_review

    click_link "Edit Review"
    fill_in 'Comment', with: "This zoo stinks!"
    choose(3)
    click_button "Add Review"

    expect(page).to have_content "Review updated successfully"
    expect(page).to have_content "Rating: 3"
    expect(page).to have_content "This zoo stinks!"
  end
end
