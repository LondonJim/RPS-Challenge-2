feature 'End of a game' do
  scenario 'Can play again, one player' do
    sign_in_std_one
    click_button 'ROCK'
    click_button ''
    click_button 'PLAY AGAIN'
    expect(page).to have_content 'Jimmy vs. COMPUTER'
  end

  scenario 'Can restart, one player' do
    sign_in_std_one
    click_button 'ROCK'
    click_button ''
    click_button 'RESTART'
    expect(page).to have_content 'Select how many players and game type:'
  end
end
