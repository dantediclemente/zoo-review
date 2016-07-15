require 'rails_helper'
feature "visitor votes on a review" do
  scenario "user votes up on a review successfully" do
    create_zoo
    write_review
    click_link("Vote Up")
    expect(page).to have_content "1"
  end
  scenario "user votes up on a review twice to cancel vote" do
    create_zoo
    write_review
    click_link("Vote Up")
    expect(page).to have_content "1"
    click_link("Vote Up")
    expect(page).to have_content "0"
  end
end
