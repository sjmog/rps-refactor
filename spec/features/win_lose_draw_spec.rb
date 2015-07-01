require 'computer'

feature "deciding win, lose, or draw" do
  scenario "rock beats scissors" do
    visit("/start-game")
    Computer.any_instance.stub(:shape).and_return(:scissors)
    click_button 'Rock'
    expect(page).to have_content "You win!"
    expect(page).not_to have_content "You lose!"
  end

  scenario "rock loses to paper" do
    visit("/start-game")
    Computer.any_instance.stub(:shape).and_return(:paper)
    click_button 'Rock'
    expect(page).to have_content "You lose!"
    expect(page).not_to have_content "You win!"
  end
end