feature 'Entering name' do
  scenario 'Can submit a name in one player game' do
    sign_in_std_one
    expect(page).to have_content 'Jimmy vs. COMPUTER'
  end

  scenario 'Can submit two names in two player game' do
    sign_in_std_two
    expect(page).to have_content 'Jimmy vs. Kathryn'
  end
end
