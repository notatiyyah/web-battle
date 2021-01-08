def sign_in_and_play
    visit('/')
    fill_in "player_1", with: "P1"
    fill_in "player_2", with: "P2"
    click_on 'Submit' 
end