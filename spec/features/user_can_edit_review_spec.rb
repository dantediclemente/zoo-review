require 'rails_helper'
feature "visitor sees a list of reviews for zoo" do
  scenario "user adds a review for a zoo successfully" do
    create_zoo
    fill_in 'Comment', with: "This zoo is awesome!"
    choose(5)
    click_button "Add Review"
    expect(page).to have_content "Review created successfully"
    expect(page).to have_content "Rating: 5"
    expect(page).to have_content "This zoo is awesome!"
    click_link "Edit Review"
    fill_in 'Comment', with: "This zoo stinks!"
    choose(3)
    click_button "Add Review"
    expect(page).to have_content "Review updated successfully"
    expect(page).to have_content "Rating: 3"
    expect(page).to have_content "This zoo stinks!"
  end
end
