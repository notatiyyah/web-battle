require "capybara/rspec"
require "./lib/app"
require 'spec_helper'
require_relative 'web_helpers.rb'

feature "Start game" do
    
    scenario 'Allow users to input names' do
        sign_in_and_play
        expect(page).to have_content "P1 : P2"
    end

    scenario "show player hit points" do
        sign_in_and_play
        expect(page).to have_content "100 : 100"
    end

end

feature "display turns" do

    scenario "display P1's turn first and P1_Attack button only" do
        sign_in_and_play
        expect(page).to have_content "P1's turn!"
        expect(page).not_to have_button("P2_Attack")
    end

    scenario "display P2's turn and P2_Attack button only" do
        sign_in_and_play
        click_on 'P1_Attack'
        expect(page).to have_content "P2's turn!"
        expect(page).not_to have_button("P1_Attack")
    end

end

feature "hit player" do
    
    scenario "player 1 hits player 2 & p2 health = -10" do
        sign_in_and_play
        click_on 'P1_Attack'
        expect(page).to have_content "100 : 90"
    end

    scenario "player 2 hits player 1 & p1 health = -10" do
        sign_in_and_play
        click_on 'P1_Attack'
        click_on 'P2_Attack'
        expect(page).to have_content "90 : 90"
    end

end

feature "end game" do
    scenario "p1 wins" do
        sign_in_and_play
        9.times do
            click_on 'P1_Attack'
            click_on 'P2_Attack'
        end
        click_on 'P1_Attack'
        expect(page).to have_content "P1 wins!"
    end
end