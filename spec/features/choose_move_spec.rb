feature '1 player entering move' do
  scenario 'Can submit a move' do
    sign_in_std_one
    click_button 'ROCK'
    click_button ''
    expect(page).to have_content 'Jimmy selected ROCK'
  end
end

feature '2 players entering moves' do
  scenario 'Can submit a move' do
    sign_in_std_two
    click_button 'ROCK'
    click_button 'ROCK'
    expect(page).to have_content 'Jimmy selected ROCK'
    expect(page).to have_content 'Kathryn selected ROCK'
  end
end
