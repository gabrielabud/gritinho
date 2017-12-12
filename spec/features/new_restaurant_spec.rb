require "rails_helper"

RSpec.feature "new restaurant", :type => :feature do
  scenario "Page has form to create new restaurant" do
    visit "/restaurant/new"
    expect(page).to have_field("name")
    expect(page).to have_field("description")
    expect(page).to have_button("Save")
  end

  scenario "Adding a new restaurant displays it on the homepage" do
    visit "/restaurant/new"
    fill_in "name", with: "Pete's"
    fill_in "description", with: "Chilli"
    click_button "Save"
    expect(page).to have_content("Pete's")
    expect(page).to have_content("Chilli")
  end
end
