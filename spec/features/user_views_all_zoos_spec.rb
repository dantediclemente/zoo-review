require 'rails_helper'
feature "visitor sees a list of zoos" do
  let!(:zoo_1) { create :zoos }
  let!(:zoo_2) { create :zoos }

  scenario "sees a list of zoos and link for new zoo" do

    visit zoos_path
    expect(page).to have_link(zoo_1.name)
    expect(page).to have_link(zoo_2.name)
    click_link "Add New Zoo"
    expect(page).to have_content "New Zoo Form"
  end

  scenario "clicks link and is taken to show page for given zoo" do

    visit root_path
    click_link(zoo_1.name)
    expect(page).to have_content zoo_1.name
    expect(page).to have_content zoo_1.address
    expect(page).to have_content zoo_1.city
    expect(page).to have_content zoo_1.state
    expect(page).to have_content zoo_1.zip
  end
end
