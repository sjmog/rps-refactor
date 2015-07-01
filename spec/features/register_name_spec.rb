require 'spec_helper'

feature "user registration" do
  scenario "visit the homepage" do
    visit("/")
    expect(page).to have_content "Register"
  end

  scenario "registers a name" do
    # set up the test (go to the right page)
    visit("/")
    # do the user interaction (fill in a form and submit)
    fill_in :user_name, with: "Samm"
    click_button "Submit"
    # expect the page to have the contents of the form
    expect(page).to have_content "Welcome, Samm"
  end

  scenario "registers a different name" do
    visit("/")
    fill_in :user_name, with: "Natalia"
    click_button "Submit"
    expect(page).to have_content "Welcome, Natalia"
    expect(page).not_to have_content "Welcome, Samm"
  end
end
