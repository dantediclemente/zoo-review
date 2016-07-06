require 'rails_helper'

feature "visitor sees a list of zoos" do

  scenario "sees a list of zoos and link for new zoo" do
    bronx_zoo = Zoos.create(name: 'Bronx Zoo', address: '33 Boring Ave', city: 'New York', state: 'NY', zip: '02211')
    franklin_park = Zoos.create(name: 'Franklin Park', address: '43 Somewhere else', city: 'Boston', state: 'MA', zip: '89023')

    visit zoos_path
    expect(page).to have_link "Bronx Zoo"
    expect(page).to have_link "Franklin Park"
    click_link "Add New Zoo"
    expect(page).to have_content "New Zoo Form"
  end

  scenario "clicks link and is taken to show page for given zoo" do
    bronx_zoo = Zoos.create(name: 'Bronx Zoo', address: '33 Boring Ave', city: 'New York', state: 'NY', zip: '02211')

    visit root_path
    click_link "Bronx Zoo"

    expect(page).to have_content bronx_zoo.name
    expect(page).to have_content bronx_zoo.address
    expect(page).to have_content bronx_zoo.city
    expect(page).to have_content bronx_zoo.state
    expect(page).to have_content bronx_zoo.zip
  end
end
