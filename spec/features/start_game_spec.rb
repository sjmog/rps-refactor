feature "start a game" do
  scenario 'start game from register page' do
    visit("/")
    fill_in :user_name, with: "Samm"
    click_button "Submit"
    expect(page).to have_content "Start a game"
  end

  scenario 'visit start game page' do
    visit("/start-game")
    expect(page).to have_content "Start a game"
  end

  scenario 'choose rock' do
    visit('/start-game')
    click_button 'Rock'
    expect(page).to have_content "You chose: Rock"
  end

  scenario 'choose paper' do
    visit('/start-game')
    click_button 'Paper'
    expect(page).to have_content "You chose: Paper"
  end

  scenario 'choose scissors' do
    visit('/start-game')
    click_button 'Scissors'
    expect(page).to have_content "You chose: Scissors"
  end

  scenario 'can only choose one of rock, paper, scissors' do
    visit('/start-game')
    click_button 'Rock'
    expect(page).to have_content "You chose: Rock"
    expect(page).not_to have_content "You chose: Paper"
    expect(page).not_to have_content "You chose: Scissors"
  end
end