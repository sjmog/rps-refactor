require 'spec_helper'

feature "user registration" do
  scenario "registers a name" do
    # set up the test (go to the right page)
    visit("/")
    # do the user interaction (fill in a form and submit)
    fill_in :user_name, with: "Samm"
    click_button "Submit"
    # expect the page to have the contents of the form
    expect(page).to have_content "Welcome, Samm"
  end
end
