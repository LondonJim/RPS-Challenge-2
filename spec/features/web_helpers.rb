def sign_in_std_one
  visit('/')
  select('1 Player', from: 'player_num').select_option
  select('STANDARD', from: 'game_type').select_option
  submit_name_one
end

def sign_in_ext_one
  visit('/')
  select('1 Player', from: 'player_num').select_option
  select('EXTENDED', from: 'game_type').select_option
  submit_name_one
end

def submit_name_one
  click_button 'Submit'
  fill_in :player_1_name, with: 'Jimmy'
  click_button 'Submit'
end

def sign_in_std_two
  visit('/')
  select('2 Player', from: 'player_num').select_option
  select('STANDARD', from: 'game_type').select_option
  submit_name_two
end

def sign_in_ext_two
  visit('/')
  select('2 Player', from: 'player_num').select_option
  select('EXTENDED', from: 'game_type').select_option
  submit_name_two
end

def submit_name_two
  click_button 'Submit'
  fill_in :player_1_name, with: 'Jimmy'
  fill_in :player_2_name, with: 'Kathryn'
  click_button 'Submit'
end
