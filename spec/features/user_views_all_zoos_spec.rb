require 'rails_helper'
feature "visitor sees a list of zoos" do
  let!(:zoo_1) { create :zoo }
  let!(:zoo_2) { create :zoo }

  scenario "sees a list of zoos" do

    visit zoos_path
    expect(page).to have_link(zoo_1.name)
    expect(page).to have_link(zoo_2.name)
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
