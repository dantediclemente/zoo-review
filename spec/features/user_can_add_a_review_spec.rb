require 'rails_helper'
feature "visitor sees a list of reviews for zoo" do
  let!(:zoo_1) { create :zoo }
  scenario "user adds a review for a zoo successfully" do
    log_in_user
    visit zoo_path(zoo_1)
    expect(page).to have_content "Zoo 1"
    fill_in 'Comment', with: "This zoo is awesome!"
    choose(5)
    click_button "Add Review"
    expect(page).to have_content "Review created successfully"
    expect(page).to have_content "Zoo 1"
    expect(page).to have_content "This zoo is awesome!"
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
