require "capybara/rspec"
require "./lib/app"
require 'spec_helper'

feature "Start game" do

    before do
        visit('/')
        fill_in "player_1", with: "P1"
        fill_in "player_2", with: "P2"
        click_on 'Submit' 
    end
    
    scenario 'Allow users to input names' do
        expect(page).to have_content "P1 : P2"
    end

    scenario "show player hit points" do
        expect(page).to have_content "100 : 100"
    end

end
